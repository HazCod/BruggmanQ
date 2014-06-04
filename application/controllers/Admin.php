<?php class Admin extends Core_controller
{

    public function __construct()
    {
        parent::__construct('admin');

        $this->template->setPartial('navbar')
            ->setPartial('headermeta')
            ->setPartial('footer')
            ->setPartial('flashmessage');
        
        $this->lists_m = Load::model('lists_m');
        $this->page_m  = Load::model('page_m');
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
            //unset($_SESSION['user']);
            $this->setFlashmessage($this->lang['accessdenied'], 'danger');
            $this->redirect('home/index');
            return false;
        } else {
            return true;
        }
    }

    public function index()
    { //show the overview admin page
        if ($this->checkPrivilege() == true){
            $this->template->lists = $this->lists_m->getLists();
            $this->template->lastusers = $this->lists_m->getLastUsers();
            $this->template->render('admin/index');
        }
    }
    
    function in_array_case_insensitive($needle, $haystack, $objProperty) 
    { // in_array(), but with case insensitivity
        if (!is_null($haystack) && !empty($haystack)){
            $needle = (string)$needle;
            $newhay = array();
            if (is_object($haystack[0])){
                foreach ($haystack as $obj){
                    $newhay[] = $obj->$objProperty;
                }
            } else {
                $newhay = $haystack;
            }
            return in_array( strtolower($needle), array_map('strtolower', $newhay) );
        } else {
            return false;
        }
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
    
    
    function generateRandomString($length = 10) {
    // Generate random string with given length
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
 
    function deleteDirectory($dir) {
    // Recursively delete a directory and it's contents
        if (!file_exists($dir)) {
            return true;
        }
        if (!is_dir($dir)) {
            return unlink($dir);
        }
        foreach (scandir($dir) as $item) {
            if ($item == '.' || $item == '..') {
                continue;
            }

            if (!$this->deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
                return false;
            }
        }
        return rmdir($dir);
    }
    
    function fixPermissions(){
    // We can only run python in sudo, so fix our files using Python!
        shell_exec('sudo python2 scripts/fixpermissions.py ' . $_SERVER['DOCUMENT_ROOT'] . '/scripts/templates');
    }
    
    function str_replace_nth($search, $replace, $subject, $nth){
        $found = preg_match_all('/'.preg_quote($search).'/', $subject, $matches, PREG_OFFSET_CAPTURE);
        if (false !== $found && $found > $nth) {
            return substr_replace($subject, $replace, $matches[0][$nth][1], strlen($search));
        }
        return $subject;
    }
    
    function calculateRegex( $str, $occurence=1){
        $str = preg_quote($str);
        $str = preg_replace('/ +/', ' *', $str);
        $str = preg_replace('/\d+\.*\d*/', '(?:\d+\.*\d*)*', $str);
        $str = $this->str_replace_nth('(?:\d+\.*\d*)*', '(\d+\.*\d*)*', $str, $occurence);
        return $str;
    }
    
    public function tools($tool=false)
    {
        if ($this->checkPrivilege()){
            if ($tool == 'regex'){
                if ($_POST){
                    $formdata = $this->form->getPost();
                    $this->form->validateLength('regex', 1);
                    $this->form->validateInteger('occurence');
                    if ($this->form->isFormValid()){
                        $this->template->result = $this->calculateRegex($formdata->regex, $formdata->occurence);
                        $this->template->render('admin/regex');
                    } else {
                        $this->setCurrentFlashmessage($this->lang['checkparameters'], 'danger');
                        $this->template->formdata = $formdata->regex;
                        $this->template->render('admin/regex');
                    }
                } else {
                    $this->template->render('admin/regex');
                }
            } else {
                $this->setFlashmessage('Wrong URL', 'danger');
                $this->redirect('admin/index');
            }
        }
    }
    
    public function templates($templ=false, $lang=false, $command=false, $nights=1)
    {
        if ($this->checkPrivilege()){
            
            $root_path = $_SERVER['DOCUMENT_ROOT'] . '/';
            
            if (!$templ or $templ == false){ //template given?
                $files = array_diff(scandir($root_path . 'scripts/templates'), array('..', '.')); //get list of templates, substract . and ..
                $entries = array();
                foreach ($files as $entry){
                    $entry = $root_path . 'scripts/templates/' . $entry; //Every template
                    if (is_dir($entry)){ //Is it a directory?
                        $lang_entries = array();
                        foreach ($this->langs_m->getLangs() as $lang){
                            //Add a language directory that 'should be there'.
                            $lang_entries[] = $entry  . '/' . $lang->flag;
                        }
                        $entries[] = array( end((explode('/', $entry))) , $lang_entries ); //Put them in an array
                    }
                }
                $this->template->templates = $entries;
                $this->template->render('admin/templates');
            } elseif ($templ != false and $lang != false and $command != false) { //All parameters given
                if ($command == 'download' and intval($nights) == $nights){ //download a template
                    //- Run the script
                    $output = shell_exec("sudo python2 scripts/manage_templates.py assemble " . $root_path . "scripts/templates/$templ/$lang/template_$nights -l $lang -o " . $root_path . "upload/template_$nights.docx". ' 2>&1'); //Run the script
                    $file = $root_path . "upload/template_$nights.docx"; //result file
                    //- Headers to anounce a file is being offered to the browser
                    header("Content-Description: File Transfer"); 
                    header("Content-Type: application/octet-stream"); 
                    header("Content-Disposition: attachment; filename=\"$templ" . "_$lang" . "_$nights.docx\""); 
                    readfile ($file); //Now send it
                } elseif ($command == 'delete'){ //Delete a template folder
                    $this->fixPermissions(); //Make sure we have access to the folder
                    shell_exec("sudo python2 scripts/manage_templates.py delete " . $root_path . "scripts/templates/$templ"); //Run the script
                    $this->setFlashmessage($this->lang['templateremoved']);
                    $this->redirect('admin/templates');
                } elseif ($command == 'add'){ //Add a new template
                    if ($_POST){ //Show the upload page or it is being uploaded
                        $name = $this->form->getPost('name'); //Get the template name
                        $ok = true;
                        foreach ($this->template->langs as $key => $lang){
                            if (!isset($_FILES["file_$lang->flag"])){ //Check if there is a template for every language
                                $ok = false;
                            }
                        }
                        if (strlen($name) >1 and $ok == true){ //If name is OK and every language has a template
                            mkdir($root_path . "scripts/templates/$name"); //create the template folder
                            $this->fixPermissions(); //Make sure we have access to it
                            foreach ($_FILES as $key => $file){ //Process every template
                                $lang = substr($key, 5); //Extract the language (input names are file_nl, file_fr, ...)

                                $files = $this->reArrayFiles($_FILES[$key]); //The templates for all nights
                                $allowedExts = array("docx"); //Only accept docx
                                $allowedNames = array("template_1.docx", "template_2.docx", "template_3.docx", "template_4.docx"); //Patients can stay for 4 nights

                                $ok = true;
                                $error = 0;
                                foreach ($files as $file){ //check every nights template
                                    $temp = explode(".", $file["name"]);
                                    $ext = end($temp); //get last portion, the extension
                                    if (!in_array($ext, $allowedExts) or !in_array($file['name'], $allowedNames) or$file['error'] > 0){ //Is the file allowed/bugged/wrongly named?
                                        $ok = false; //no! Don't generate a report!
                                        $error = $file['error']; //Save the file error to show afterwards
                                    }
                                }

                                if ($ok){ //Everything is OK, start!
                                    mkdir($root_path . "scripts/templates/$name/$lang"); //language directory
                                    foreach ($files as $file){
                                        $tname = substr($file['name'], 0, -5);
                                        $dir = $root_path . "scripts/templates/$name/$lang"; //template location
                                        //error_log($dir);
                                        mkdir("$dir/$tname");
                                        $tempfile = $root_path . "scripts/templates/$name/$lang/$tname.docx";
                                        if (!move_uploaded_file($file['tmp_name'], $tempfile)){ //Move to temp location
                                            error_log('could not move ' . $file['tmp_name'] . ' to ' . $tempfile);
                                        }
                                        chmod($tempfile, 0777); //just to be sure
                                        $output = shell_exec("sudo python2 scripts/manage_templates.py extract $tempfile -l $lang -o $dir". ' 2>&1'); //Do the stuff
                                        $this->fixPermissions(); //Fix permissions
                                        //Cleanup
                                        shell_exec("sudo python2 scripts/remove.py $temp");
                                        $tmp = $file['tmp_name'];
                                        shell_exec("sudo python2 scripts/remove.py $tmp");
                                    }
                                } else {
                                    //Remove template
                                    shell_exec("sudo python2 scripts/manage_templates.py delete " . $root_path . "scripts/templates/$name"); //Run the script
                                    $this->setCurrentFlashmessage('Not OK: ' . $this->lang['invalidfile'] . $this->lang['invalidtemplatename'] . ' (' . $error . ')', 'danger');
                                    $this->template->render('admin/templates.add'); 
                                }
                            }
                            $this->setFlashmessage($this->lang['addedtemplate']);
                            $this->redirect('admin/templates');   
                        } else {
                            $this->setCurrentFlashmessage($this->lang['templateadderror'], 'danger');
                            $this->template->render('admin/templates.add');
                        }             
                    } else {
                        $this->template->render('admin/templates.add');
                    }
                } elseif ($command == 'replace'){ //Replace existing template
                    if ($_POST){ //Template has been posted, start upload!
                        $file = $_FILES['file'];
                        if ($file['error'] == '0'){ //No errors during upload
                            $this->fixPermissions(); //Fix permissions prior to upload
                            
                            $tempfile = $file['tmp_name']; //tmp file name
                            $dir = $root_path . "scripts/templates/$templ/$lang/template_$nights"; //Output path
                            $this->deleteDirectory($dir); //remove old template
                            $output = shell_exec("sudo python2 scripts/manage_templates.py extract $tempfile -l $lang -o $dir". ' 2>&1'); //Do the stuff
                            $this->setFlashmessage($this->lang['templatereplaced']);
                            $this->fixPermissions(); //Fix permissions
                            $this->redirect('admin/templates');
                        } else {
                            $this->template->templ = $templ; //template 
                            $this->template->tlang = $lang; //language
                            $this->template->nights = $nights; //amount of nights (template_1 e.g.)
                            $this->setCurrentFlashmessage($this->lang['templateadderror'], 'danger');
                            $this->template->render('admin/templates.replace'); 
                        }
                    } else {
                        $this->template->templ = $templ; //template
                        $this->template->tlang = $lang; //language
                        $this->template->nights = $nights; //amount of nights
                        $this->template->render('admin/templates.replace');
                    }
                } else {
                    $this->setFlashmessage("Invalid URL: $templ/$lang/$command/$nights", 'danger');
                    $this->redirect('admin/templates');                   
                }
            } else {
                $this->setFlashmessage('No action, lang or template in URL.', 'danger');
                $this->redirect('admin/templates');
            }
        }
    }
    
    
    public function langs($command=false, $par1=false)
    // Manage languages
    {
        if ($this->checkPrivilege() == true){
            if (!$command or $command == false){ //Show languages overview
                $this->setCurrentFlashmessage($this->lang['langsnotice'], 'info');
                $this->template->render('admin/langs');
            } elseif ($command == 'add'){ //add new language
                if ($_POST){ //language is being sent
                    $formdata = $this->form->getPost(); //get the POST data
                    $this->form->validateLength('name', 3); //name minimum 3 chars?
                    $this->form->validateLength('flag', 2); //flagcode minimum 2 chars?
                    if ($this->form->isFormValid() and !$this->in_array_case_insensitive($formdata->name, $this->template->langs, 'name')){ //Name not already existant and form correct?
                        $this->langs_m->addLang($formdata->name, htmlentities($formdata->flag)); //Add it!
                        $this->setFlashmessage($this->lang['addedlang']);
                        $this->redirect('admin/langs');
                    } else {
                        $this->template->formdata = $formdata;
                        $this->setCurrentFlashmessage($this->lang['erroraddinglang'], 'danger'); //Some error
                        $this->template->render('admin/langs.add');
                    }
                } else {
                    $this->template->render('admin/langs.add');
                }
            } elseif ($command == 'delete'){ //Remove language from database
                $this->langs_m->deleteLang($par1);
                $this->setCurrentFlashmessage($this->lang['deletedlang']);
                $this->template->render('admin/langs');
            } else {
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/index');   
            }
        }
    }
    
    
    public function answers($question=false, $command=false, $par1=false)
    // Manage question answers
    {
        if ($this->checkPrivilege() == true){
            if ($question){ //Is the question is existant
               if (!$command or $command == false){ //Question overview
                    $this->template->answers = $this->answers_m->getAnswers($question);
                    $this->template->question = $this->questions_m->getQuestion($question);
                    $this->template->types = $this->questions_m->getTypes();
                    $this->template->render('admin/questions.answers');
                } elseif ($command == 'add'){ //Add new question
                    if ($_POST){ //Question is being posted
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('descr', 1); //question description
                        $this->form->validateLength('code', 1);  // question identification code for reports
                        if (!$formdata->nr){
                            $formdata->nr = 0; //If no number is given, just set zero
                        }
                        if ($this->form->isFormValid()){ //answer is valid
                            $this->setFlashmessage($this->lang['addedanswer']);
                            $this->answers_m->addAnswer(htmlentities($formdata->descr), htmlentities($question), $formdata->nr, $formdata->code);
                            $this->redirect('admin/answers/' . $question);
                        } else { //some error
                            $this->setCurrentFlashmessage($this->lang['erroraddinganswer'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->answers = $this->answers_m->getAnswers($question);
                            $this->template->question = $question;
                            $this->template->render('admin/questions.answers.add');
                        }
                    } else { //Show add answer page
                        $this->template->question = $this->questions_m->getQuestion($question);
                        $this->template->answers = $this->answers_m->getAnswers($question);
                        $this->template->render('admin/questions.answers.add');
                    }
                } elseif ($command == 'delete'){ //delete it
                    $this->answers_m->deleteAnswer($par1);
                    $this->setFlashmessage($this->lang['deletedanswer']);
                    $this->redirect('admin/answers/' . $question);
                } elseif ($command == 'up'){ //move it up the list
                    $this->answers_m->moveAnswerUp($par1);
                    $this->redirect('admin/answers/' . $question);
                } elseif ($command == 'down'){ //move it down the list
                    $this->answers_m->moveAnswerDown($par1);
                    $this->redirect('admin/answers/' . $question);
                }
            } else { //URL not recognized
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/index');   
            }
        }
    }
    
    public function questions($page=false, $command=false, $par1=false)
    // Manage questions
    {
        if ($this->checkPrivilege() == true){
            if ($page){
                if (!$command or $command == false){ //Question overview
                    $this->template->questions = $this->questions_m->getQuestions($page);
                    $this->template->types = $this->questions_m->getTypes();
                    $this->template->page = $page;
                    $this->template->render('admin/questions');
                } elseif ($command == 'add'){ //Add new question
                    if ($_POST){ //Question data has been posted
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('descr', 3); //description
                        $this->form->validateLength('code', 2); // question identification in the report
                        if (!$formdata->nr){
                            $formdata->nr = 0; //If no number given, just set zero
                        }
                        if ($this->form->isFormValid()){ //Everything is correct, add it!
                            $this->setFlashmessage($this->lang['addedquestion']);
                            $this->questions_m->addQuestion(htmlentities($formdata->descr), $formdata->type, $formdata->nr, $formdata->extra, $formdata->code, $page);
                            $this->redirect('admin/questions/' . $page);
                        } else { //Some error
                            $this->setCurrentFlashmessage($this->lang['erroraddingquestion'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->page = $page;
                            $this->template->render('admin/questions.add');
                        }
                    } else { //Show question overview
                        $this->template->questions = $this->questions_m->getQuestions($page);
                        $this->template->types = $this->questions_m->getTypes();
                        $this->template->page = $page;
                        $this->template->render('admin/questions.add');
                    }
                } elseif ($command == 'delete') { //Remove question
                    $this->questions_m->deleteQuestion($par1);
                    $this->setFlashmessage($this->lang['deletedquestion']);
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'up'){ //Move question up
                    $this->questions_m->moveQuestionUp($par1);
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'down'){ //Move question down
                    $this->questions_m->moveQuestionDown($par1);
                    $this->redirect('admin/questions/' . $page);
                } else { //Wrong action in URL
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists');    
                }
            } else { //Wrong action in URL
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/lists');   
            }
        }
    }
    
    public function data($usr=false, $command=false, $par1=false)
    // Manage submitted data
    {
        if ($this->checkPrivilege() == true){
            if (!$usr){ //user not given, so show all data overview
                $this->template->datas = $this->data_m->getAllData();
                $t = $this->data_m->getUserAnswers($usr);
                if (!$t){ //default language is nl
                    $this->template->langcode = 'nl';
                } else { //if found, get user questionnaire language
                    $this->template->langcode = $t[0]->lang;                 
                }        
                $this->template->render('admin/data');
            } else {
                if ($command == 'delete'){ //Remove user data !Everything is lost!
                    $this->data_m->deleteUserData($usr);
                    $this->setFlashmessage($this->lang['removeddata']);
                    $this->redirect('admin/data');
                } else { //just show user answers
                    $this->template->datas = $this->data_m->getUserAnswers($usr);
                    $this->template->render('admin/datalist');
                }
            }
        }
    }
    
    public function pages($list=false, $command=false, $par1=false)
    // Manage pages of the questionnaire
    {
        if ($this->checkPrivilege() == true){
            if ($list){
                if (!$command or $command == false){ //Show all pages of list $list
                    $this->template->pages = $this->page_m->getPages($list);
                    $this->template->list = $list;
                    $this->template->render('admin/pages');
                } else if ($command == 'add'){ //Add a new page
                    if ($_POST){ //Post data given, so request for adding page
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('pagename', 3);
                        $this->form->validateLength('descr', 3);
                        if (!$formdata->nr){
                            $formdata->nr = 0; //If no nr given, set to zero
                        }
                        if ($this->form->isFormValid()){ //Everything is valid, add it!
                            $this->page_m->addPage($list, $formdata->nr, htmlentities($formdata->descr), htmlentities($formdata->pagename));
                            $this->setFlashmessage($this->lang['addedpage']);
                            $this->redirect('admin/pages/' . $list);
                        } else { //Some error
                            $this->setCurrentFlashmessage($this->lang['erroraddingpage'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->list = $list;
                            $this->template->render('admin/lists.add');
                        }
                    } else { //Show pages overview
                        $this->template->pages = $this->page_m->getPages($list);
                        $this->template->list = $list;
                        $this->template->render('admin/pages.add');
                    }
                } elseif ($command == 'delete'){ //delete this page (and all question, answers, ..  NOT data tough)
                    $this->page_m->deletePage($par1);
                    $this->setFlashmessage($this->lang['deletedpage']);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'up'){ //move page up in the list
                    $this->page_m->movePageUp($par1);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'down'){ //move page down in the list
                    $this->page_m->movePageDown($par1);
                    $this->redirect('admin/pages/' . $list);
                } else { //Wrong action in URL
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists'); 
                }
            } else { //Wrong action in URL
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/lists'); 
            }
        }
    }
    
    public function lists($command=false, $par1=false)
    // Manage questionnaires
    {
        if ($this->checkPrivilege() == true){
            if ($command == false){ //Show questionnaire overview
                $this->template->lists = $this->lists_m->getLists();
                $this->template->render('admin/lists');
            } else {
                if ($command == 'add'){ //Add new questionnaire
                    if ($_POST){ //Post data has been given, add it
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('listname', 3);
                        if ($this->form->isFormValid()) { //It's Okay, add it!
                            if (!$this->in_array_case_insensitive($formdata->listname, $this->lists_m->getLists(), 'name')){ #valid parameters and name not existant
                                $this->lists_m->addList(htmlentities($formdata->listname), $formdata->lang);
                                $this->setFlashmessage($this->lang['addedlist']);
                                $this->redirect('admin/lists');
                            } else { #Some error
                                $this->setCurrentFlashmessage($this->lang['erroraddinglist'], 'danger');
                                $this->template->listname = $formdata->listname;
                                $this->template->render('admin/lists.add');
                            }
                        } else { #some error
                            $this->template->formdata = $formdata;
                            $this->setCurrentFlashmessage($this->lang['wronglistname'], 'danger');
                            $this->template->render('admin/lists'); 
                        }
                    } else {
                        $this->template->render('admin/lists.add');
                    }
                } elseif ($command == 'delete' && $par1) { #remove questionnaire
                    $this->lists_m->deleteList($par1);
                    $this->setFlashmessage($this->lang['listremoved']);
                    $this->redirect('admin/lists');
                } else { #wrong action in URL
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists');
                }
            }
        }
    }

}