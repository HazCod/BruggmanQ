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
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
    
    function reArrayFiles(&$file_post) {
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
    
    public function index()
    {
        if ($this->checkPrivilege() == true){
            $this->setFlashmessage($this->lang['accessdenied'], 'danger');
            $this->redirect('admin/index');
        }
    }
    
    
    public function generate($userid=false, $language=false)
    {
        if ($this->checkPrivilege()){
            if ($userid){
                if ($_POST){
                    $template = $this->form->getPost('template');
                    if (isset($_FILES['files'])){                
                        $files = $this->reArrayFiles($_FILES['files']);
                        $allowedExts = array("html", "txt", "rtf");

                        $ok = true;
                        $error = 0;
                        foreach ($files as $file){
                            $temp = explode(".", $file["name"]);
                            $ext = end($temp);
                            if (!in_array($ext, $allowedExts) or $file['error'] > 0){
                                $ok = false;
                                $error = $file['error'];
                            }
                        }

                        if ($ok) {
                            $datastr = '';
                            foreach ($files as $file){
                                $datafile = '/tmp/' . $this->generateRandomString() . '.' .end(explode('.', $file['name']));
                                if (!move_uploaded_file($file["tmp_name"], $datafile)){
                                    $ok = false;
                                    error_log('could not move ' . $file['tmp_name'] . ' to ' . $datafile);
                                }
                                chmod($datafile, 0777);
                                $datastr .= $datafile . ',';
                            }                            
                            $datastr = rtrim($datastr, ',');
                            if (!$language){
                                $language = 'nl';
                            }
                            
                           if ($ok == False or $template == false){
                                $this->setFlashmessage($this->lang['scripterror'], 'danger');
                                $this->redirect('report/generate/' . $userid . '/' . $language);
                            } else {
                                $results = '/var/www/upload/report.docx';
                                
                                $parameters = URL::base_uri() . 'scripts/report_parameters';
                                $raw = "/tmp/" . $this->generateRandomString(8);

                                $questionnaire = '/tmp/' . $this->generateRandomString(8);
                                $q_data = $this->data_m->getUserAnswers($userid);
                                
                                $file = fopen($questionnaire, 'w');
                                foreach ($q_data as $question)
                                {
                                    fwrite($file, $question->code . "\t" . $question->answer . "\n");
                                }
                                fclose($file);

                                $this->template->cmd = "sudo python2 scripts/readout_data.py --language $language --questionnaire $questionnaire --output $results --parameters $parameters --raw $raw $template $datastr";
                                $output = shell_exec($this->template->cmd . ' 2>&1');

                                $this->template->result = URL::base_uri() . 'upload/report.docx';
                                $this->template->name = 'report.docx';
                                $this->template->output = $output;
                                
                                //- Cleanup
                                /** delete($raw);
                                delete($questionnaire);
                                $files = explode(',', $datastr);
                                foreach ($datastr as $file){
                                    delete($file);
                                }**/
                                
                                $this->template->render('report/result');
                            }
                        } else {
                            $this->setCurrentFlashmessage('Not OK: ' . $this->lang['invalidfile'] . ' (' . $error . ')', 'danger');
                            $this->template->userid= $userid;
                            $this->template->langcode = $language;
                            $this->template->render('report/upload'); 
                        }
                    } else {
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
