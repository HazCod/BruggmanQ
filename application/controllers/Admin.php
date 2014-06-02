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
                        $tmpl_langs = array();
                        foreach ($this->langs_m->getLangs() as $lang){
                            $lang_entries[] = $entry  . '/' . $lang->flag;
                        }
                        /** $langs = array_diff(scandir($entry), array('..', '.')); //Exclude . and ..
                        $lentries = array();
                        foreach ($lentries as $lentry){ //get languages
                            $lentry = $root_path . 'scripts/templates/' . $lentry;
                            if (is_dir($lentry)){ //Is it a dir?
                                $langs[] = $lentry; //Include the language
                            }
                        } **/
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
                                        chmod($tempfile, 0777);
                                        $output = shell_exec("sudo python2 scripts/manage_templates.py extract $tempfile -l $lang -o $dir". ' 2>&1');
                                        $this->fixPermissions();
                                        unlink($tempfile);
                                        unlink($file['tmp_name']);
                                    }
                                } else {
                                    //Remove template
                                    shell_exec("sudo python2 scripts/manage_templates.py delete " . $root_path . "scripts/templates/$name"); //Run the script
                                    $this->setCurrentFlashmessage('Not OK: ' . $this->lang['invalidfile'] . $this->lang['invalidtemplatename'] . ' (' . $error . ')', 'danger');
                                    $this->template->render('admin/templates.add'); 
                                }
                            }
                            //$this->fixPermissions();
                            $this->setFlashmessage($this->lang['addedtemplate']);
                            $this->redirect('admin/templates');   
                        } else {
                            $this->setCurrentFlashmessage($this->lang['templateadderror'], 'danger');
                            $this->template->render('admin/templates.add');
                        }             
                    } else {
                        $this->template->render('admin/templates.add');
                    }
                } elseif ($command == 'replace'){
                    if ($_POST){
                        $file = $_FILES['file'];
                        if ($file['error'] == '0'){
                            $this->fixPermissions();
                            
                            $tempfile = $file['tmp_name'];
                            $dir = $root_path . "scripts/templates/$templ/$lang/template_$nights";
                            $this->deleteDirectory($dir);
                            $output = shell_exec("sudo python2 scripts/manage_templates.py extract $tempfile -l $lang -o $dir". ' 2>&1');
                            $this->setFlashmessage($this->lang['templatereplaced']);
                            $this->fixPermissions();
                            $this->redirect('admin/templates');
                        } else {
                            $this->template->templ = $templ;
                            $this->template->tlang = $lang;
                            $this->template->nights = $nights;
                            $this->setCurrentFlashmessage($this->lang['templateadderror'], 'danger');
                            $this->template->render('admin/templates.replace'); 
                        }
                    } else {
                        $this->template->templ = $templ;
                        $this->template->tlang = $lang;
                        $this->template->nights = $nights;
                        $this->template->render('admin/templates.replace');
                    }
                } elseif ($command == 'chmod'){ //temp
                    $this->fixPermissions();
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
    {
        if ($this->checkPrivilege() == true){
            if (!$command or $command == false){
                $this->setCurrentFlashmessage($this->lang['langsnotice'], 'info');
                $this->template->render('admin/langs');
            } elseif ($command == 'add'){
                if ($_POST){
                    $formdata = $this->form->getPost();
                    $this->form->validateLength('name', 3);
                    $this->form->validateLength('flag', 2);
                    if ($this->form->isFormValid() and !$this->in_array_case_insensitive($formdata->name, $this->template->langs, 'name')){
                        $this->langs_m->addLang($formdata->name, htmlentities($formdata->flag));
                        $this->setFlashmessage($this->lang['addedlang']);
                        $this->redirect('admin/langs');
                    } else {
                        $this->template->formdata = $formdata;
                        $this->setCurrentFlashmessage($this->lang['erroraddinglang'], 'danger');
                        $this->template->render('admin/langs.add');
                    }
                } else {
                    $this->template->render('admin/langs.add');
                }
            } elseif ($command == 'delete'){
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
    {
        if ($this->checkPrivilege() == true){
            if ($question){
               if (!$command or $command == false){
                    $this->template->answers = $this->answers_m->getAnswers($question);
                    $this->template->question = $this->questions_m->getQuestion($question);
                    $this->template->types = $this->questions_m->getTypes();
                    $this->template->render('admin/questions.answers');
                } elseif ($command == 'add'){
                    if ($_POST){
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('descr', 1);
                        $this->form->validateLength('code', 1);
                        if (!$formdata->nr){
                            $formdata->nr = 0;
                        }
                        if ($this->form->isFormValid()){
                            $this->setFlashmessage($this->lang['addedanswer']);
                            $this->answers_m->addAnswer(htmlentities($formdata->descr), htmlentities($question), $formdata->nr, $formdata->code);
                            $this->redirect('admin/answers/' . $question);
                        } else {
                            $this->setCurrentFlashmessage($this->lang['erroraddinganswer'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->answers = $this->answers_m->getAnswers($question);
                            $this->template->question = $question;
                            $this->template->render('admin/questions.answers.add');
                        }
                    } else {
                        $this->template->question = $this->questions_m->getQuestion($question);
                        $this->template->answers = $this->answers_m->getAnswers($question);
                        $this->template->render('admin/questions.answers.add');
                    }
                } elseif ($command == 'delete'){
                    $this->answers_m->deleteAnswer($par1);
                    $this->setFlashmessage($this->lang['deletedanswer']);
                    $this->redirect('admin/answers/' . $question);
                } elseif ($command == 'up'){
                    $this->answers_m->moveAnswerUp($par1);
                    $this->redirect('admin/answers/' . $question);
                } elseif ($command == 'down'){
                    $this->answers_m->moveAnswerDown($par1);
                    $this->redirect('admin/answers/' . $question);
                }
            } else {
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/index');   
            }
        }
    }
    
    public function questions($page=false, $command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if ($page){
                if (!$command or $command == false){
                    $this->template->questions = $this->questions_m->getQuestions($page);
                    $this->template->types = $this->questions_m->getTypes();
                    $this->template->page = $page;
                    $this->template->render('admin/questions');
                } elseif ($command == 'add'){
                    if ($_POST){
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('descr', 3);
                        $this->form->validateLength('code', 2);
                        if (!$formdata->nr){
                            $formdata->nr = 0;
                        }
                        if ($this->form->isFormValid()){
                            $this->setFlashmessage($this->lang['addedquestion']);
                            $this->questions_m->addQuestion(htmlentities($formdata->descr), $formdata->type, $formdata->nr, $formdata->extra, $formdata->code, $page);
                            $this->redirect('admin/questions/' . $page);
                        } else {
                            $this->setCurrentFlashmessage($this->lang['erroraddingquestion'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->page = $page;
                            $this->template->render('admin/questions.add');
                        }
                    } else {
                        $this->template->questions = $this->questions_m->getQuestions($page);
                        $this->template->types = $this->questions_m->getTypes();
                        $this->template->page = $page;
                        $this->template->render('admin/questions.add');
                    }
                } elseif ($command == 'delete') {
                    $this->questions_m->deleteQuestion($par1);
                    $this->setFlashmessage($this->lang['deletedquestion']);
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'up'){
                    $this->questions_m->moveQuestionUp($par1);
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'down'){
                    $this->questions_m->moveQuestionDown($par1);
                    $this->redirect('admin/questions/' . $page);
                } else {
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists');    
                }
            } else {
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/lists');   
            }
        }
    }
    
    public function data($usr=false, $command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if (!$usr){
                $this->template->datas = $this->data_m->getAllData();
                $t = $this->data_m->getUserAnswers($usr);
                if (!$t){
                    $this->template->langcode = 'nl';
                } else {
                    $this->template->langcode = $t[0]->lang;                 
                }        
                $this->template->render('admin/data');
            } else {
                if ($command == 'delete'){
                    $this->data_m->deleteUserData($usr);
                    $this->setFlashmessage($this->lang['removeddata']);
                    $this->redirect('admin/data');
                } else {
                    $this->template->datas = $this->data_m->getUserAnswers($usr);
                    $this->template->render('admin/datalist');
                }
            }
        }
    }
    
    public function pages($list=false, $command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if ($list){
                if (!$command or $command == false){
                    //Show all pages of list $list
                    $this->template->pages = $this->page_m->getPages($list);
                    $this->template->list = $list;
                    $this->template->render('admin/pages');
                } else if ($command == 'add'){
                    if ($_POST){
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('pagename', 3);
                        $this->form->validateLength('descr', 3);
                        if (!$formdata->nr){
                            $formdata->nr = 1;
                        }
                        if ($this->form->isFormValid()){
                            $this->page_m->addPage($list, $formdata->nr, htmlentities($formdata->descr), htmlentities($formdata->pagename));
                            $this->setFlashmessage($this->lang['addedpage']);
                            $this->redirect('admin/pages/' . $list);
                        } else {
                            $this->setCurrentFlashmessage($this->lang['erroraddingpage'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->list = $list;
                            $this->template->render('admin/lists.add');
                        }
                    } else {
                        $this->template->pages = $this->page_m->getPages($list);
                        $this->template->list = $list;
                        $this->template->render('admin/pages.add');
                    }
                } elseif ($command == 'delete'){
                    $this->page_m->deletePage($par1);
                    $this->setFlashmessage($this->lang['deletedpage']);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'up'){
                    $this->page_m->movePageUp($par1);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'down'){
                    $this->page_m->movePageDown($par1);
                    $this->redirect('admin/pages/' . $list);
                } else {
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists'); 
                }
            } else {
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/lists'); 
            }
        }
    }
    
    public function lists($command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if ($command == false){
                $this->template->lists = $this->lists_m->getLists();
                $this->template->render('admin/lists');
            } else {
                if ($command == 'add'){
                    if ($_POST){
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('listname', 3);
                        if ($this->form->isFormValid()) {
                            //var_dump($this->lists_m->getLists()); quit();
                            if (!$this->in_array_case_insensitive($formdata->listname, $this->lists_m->getLists(), 'name')){
                                $this->lists_m->addList(htmlentities($formdata->listname), $formdata->lang);
                                $this->setFlashmessage($this->lang['addedlist']);
                                $this->redirect('admin/lists');
                            } else {
                                $this->setCurrentFlashmessage($this->lang['erroraddinglist'], 'danger');
                                $this->template->listname = $formdata->listname;
                                $this->template->render('admin/lists.add');
                            }
                        } else {
                            $this->template->formdata = $formdata;
                            $this->setCurrentFlashmessage($this->lang['wronglistname'], 'danger');
                            $this->template->render('admin/lists'); 
                        }
                    } else {
                        $this->template->render('admin/lists.add');
                    }
                } elseif ($command == 'delete' && $par1) {
                    $this->lists_m->deleteList($par1);
                    $this->setFlashmessage($this->lang['listremoved']);
                    $this->redirect('admin/lists');
                } else {
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists');
                }
            }
        }
    }

}