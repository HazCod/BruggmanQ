<?php class Report extends Core_controller
{

    public function __construct()
    {
        parent::__construct('admin');

        $this->template->setPartial('navbar')
            ->setPartial('headermeta')
            ->setPartial('footer')
            ->setPartial('flashmessage');
        
        $this->questions_m = Load::model('questions_m');
        $this->answers_m = Load::model('answers_m');
        $this->langs_m = Load::model('langs_m');
        $this->data_m = Load::model('data_m');
        
        $this->menu_m = Load::model('menu_m');
        $this->template->menuitems = $this->menu_m->getBeheerderMenu($this->lang);
        $this->template->langs = $this->langs_m->getLangs();
		
	   $this->template->setPagetitle('Brugmann');
    }
    
    function checkPrivilege()
    {
        if (!isset($_SESSION['admin'])){
            unset($_SESSION['user']);
            $this->setFlashmessage($this->lang['accessdenied'], 'danger');
            $this->redirect('home/index');
            return false;
        } else {
            return true;
        }
    }
    
    function generateRandomString($length = 10) {
    // Generate a random string given the length
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
    
    function reArrayFiles(&$file_post) {
    // Make the $_FILES array a bit easier to work with
        $file_ary = array();
        $file_count = count($file_post['name']);
        $file_keys = array_keys($file_post);

        for ($i=0; $i<$file_count; $i++) {
            foreach ($file_keys as $key) {
                $file_ary[$i][$key] = $file_post[$key][$i];
            }
        }

        return $file_ary;
    }
    
    function transformQuestionnaire($arr) {
    // Make sure that double keys in the array are transformed to a single key with value1|value2 etcetera..
        $new_arr = array();
        foreach ($arr as $array){
            if (!in_array($array->code, array_keys($new_arr))){ //not a double value
                $new_arr[$array->code] = $array->answer;
            } else { //Append it to the existing value
                $new_arr[$array->code] .= '|' . $array->answer;
            }
        }
        return $new_arr;
    }
    
    public function index()
    { // Rather a placeholder
        if ($this->checkPrivilege() == true){
            $this->setFlashmessage($this->lang['accessdenied'], 'danger');
            $this->redirect('admin/index');
        }
    }
    
    
    public function excel($command=false)
    {
        if ($this->checkPrivilege()){
            if ($command){
                if ($command == 'download'){
                    header("Content-Type: application/octet-stream");
                    header("Content-Transfer-Encoding: Binary");
                    header("Content-disposition: attachment; filename=\"PSG_database.xls\""); 
                    echo readfile($_SERVER['DOCUMENT_ROOT'] . '/upload/PSG.xls');
                } elseif ($command == 'remove') {
                    shell_exec('sudo python2 scripts/remove.py upload/PSG.xls');
                    copy('upload/empty.xls', 'upload/PSG.xls');
                    shell_exec("sudo python2 scripts/fixpermissions.py upload/PSG.xls");
                    $this->setFlashmessage('PSG Cleared');
                    $this->redirect('admin/data');
                } else {
                    $this->setFlashmessage('Bad URL!', 'danger');
                    $this->redirect('admin/data'); 
                }
            } else {
                $this->setFlashmessage('Bad URL!', 'danger');
                $this->redirect('admin/data');
            }
        }
    }
    
    
    public function generate($userid=false, $language=false)
    {
        if ($this->checkPrivilege()){
            
            $root_path = $_SERVER['DOCUMENT_ROOT'] . '/';
            
            if ($userid){ //User given (We suppose admins don't have to fiddle with user ids in the URLs)
                if ($_POST){
                    $template = $this->form->getPost('template');
                    if (isset($_FILES['files'])){  //Files submitted?              
                        $files = $this->reArrayFiles($_FILES['files']); //Make them more readable
                        $allowedExts = array("html", "txt", "rtf"); //The files we accept
                        
                        $ok = true;
                        $error = 0;
                        foreach ($files as $file){ //Process every file
                            $temp = explode(".", $file["name"]);
                            $ext = end($temp);
                            if (!in_array($ext, $allowedExts) or $file['error'] > 0){ //Is the file allowed/bugged?
                                $ok = false; //no! Don't generate a report!
                                $error = $file['error']; //Save the file error to show afterwards
                            }
                        }

                        if ($ok) { //Everything is OK with the files, submit them!
                            $datastr = ''; //String for all datafiles
                            foreach ($files as $file){ //Process every file
                                $datafile = '/tmp/' . $this->generateRandomString() . '.' .end(explode('.', $file['name'])); //Temporarely store the file here
                                if (!move_uploaded_file($file["tmp_name"], $datafile)){ //(try to) Move it
                                    $ok = false; //it didnt work
                                    error_log('could not move ' . $file['tmp_name'] . ' to ' . $datafile); //logging purposes
                                }
                                chmod($datafile, 0777); //to be sure we can work with it
                                $datastr .= $datafile . ','; //Add it to the line for our script
                            }                            
                            $datastr = rtrim($datastr, ','); //Remove the last obsolete comma
                            if (!$language){ //No language given, so use default
                                $language = 'nl';
                            }
                            
                           if ($ok == False or $template == false){ //There were errors
                                $this->setFlashmessage($this->lang['scripterror'], 'danger');
                                $this->redirect('report/generate/' . $userid . '/' . $language);
                            } else { //begin!
                                $results = $root_path . 'upload/report.docx'; //This will be our result
                                
                                $parameters = '/scripts/report_parameters'; //Here are our parameters
                                $raw = "/tmp/" . $this->generateRandomString(8); //Temporary file where we store our raw file

                                $questionnaire = '/tmp/' . $this->generateRandomString(8); //Temporary file where we store our questionnaire data
                                $q_data = $this->data_m->getUserAnswers($userid); //Get our questionnaire data
                                $q_data = $this->transformQuestionnaire($q_data); //Get rid of the double values
                                $file = fopen($questionnaire, 'w'); //Write the questionnaire to the file                              
                                foreach ($q_data as $question => $answer)
                                {
                                    fwrite($file, $question . "\t" . $answer . "\n");
                                }
                                fclose($file);
                                //- Run the script!
                                $excel = $root_path . 'upload/PSG.xls';
                                $this->template->cmd = "sudo python2 scripts/readout_data.py --language $language --questionnaire $questionnaire --excel $excel --output $results --parameters $parameters --raw $raw $template $datastr";
                                $output = shell_exec($this->template->cmd . ' 2>&1');
                                //- Pass our variables to the template
                                $this->template->result = URL::base_uri() . 'upload/report.docx';
                                $this->template->name = 'report.docx';
                                $this->template->output = $output;
                                
                                //- Cleanup
                                shell_exec("sudo python2 scripts/fixpermissions.py $root_path" . "upload/PSG.xls");
                                shell_exec("sudo python2 scripts/remove.py $raw");
                                shell_exec("sudo python2 scripts/remove.py $questionnaire");
                                $files = explode(',', $datastr);
                                foreach ($files as $file){
                                    shell_exec("sudo python2 scripts/remove.py $file");
                                }
                                
                                $this->template->render('report/result');
                            }
                        } else { //Invalid files submitted
                            $this->setCurrentFlashmessage('Not OK: ' . $this->lang['invalidfile'] . ' (' . $error . ')', 'danger');
                            $this->template->userid= $userid;
                            $this->template->langcode = $language;
                            $this->template->render('report/upload'); 
                        }
                    } else { //Invalid files submitted
                            $this->setCurrentFlashmessage($this->lang['invalidfile'] . ' (' . $error . ')', 'danger');
                            $this->template->userid= $userid;
                            $this->template->langcode = $language;
                            $this->template->render('report/upload');
                    }
                } else {
                    //upload it
                    $this->template->userid= $userid;
                    $this->template->langcode = $language;
                    $this->template->render('report/upload');
                } 
            } else {
                $this->setCurrentFlashmessage($this->lang['noparameter'], 'danger');
                $this->redirect('admin/index');
            }
        }
    }
   
}
