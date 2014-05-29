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
    {
        if ($this->checkPrivilege() == true){
            $this->template->lists = $this->lists_m->getLists();
            $this->template->lastusers = $this->lists_m->getLastUsers();
            $this->template->render('admin/index');
        }
    }
    
    function in_array_case_insensitive($needle, $haystack, $objProperty) 
    {
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
    
        
    function generateRandomString($length = 10) {
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
 
    function deleteDirectory($dir) {
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

    
    public function templates($templ=false, $lang=false, $command=false, $nights=1)
    {
        if ($this->checkPrivilege()){
            if (!$templ or $templ == false){
                $files = array_diff(scandir('/var/www/scripts/templates'), array('..', '.'));
                $entries = array();
                foreach ($files as $entry){
                    $entry = '/var/www/scripts/templates/' . $entry;
                    if (is_dir($entry)){
                        $langs = array_diff(scandir($entry), array('..', '.'));
                        $lentries = array();
                        foreach ($lentries as $lentry){
                            $lentry = '/var/www/scripts/templates/' . $lentry;
                            if (is_dir($lentry)){
                                $langs[] = $lentry;
                            }
                        }
                        $entries[] = array( end((explode('/', $entry))) , $langs );
                    }
                }
                $this->template->templates = $entries;
                $this->template->render('admin/templates');
            } elseif ($templ != false and $lang != false and $command != false) {
                if ($command == 'download' and intval($nights) == $nights){
                    $output = shell_exec("sudo python2 scripts/manage_templates.py assemble /var/www/scripts/templates/$templ/$lang/template_$nights -l $lang -o /var/www/upload/template_$nights.docx". ' 2>&1');
                    $file = "/var/www/upload/template_$nights.docx";
                    header("Content-Description: File Transfer"); 
                    header("Content-Type: application/octet-stream"); 
                    header("Content-Disposition: attachment; filename=\"$templ" . "_$lang" . "_$nights.docx\""); 
                    readfile ($file); 
                } elseif ($command == 'delete'){
                    $output = $this->deleteDirectory("/var/www/scripts/templates/$templ");
                    $this->setFlashmessage($this->lang['templateremoved'] . ' (' . $output . ')');
                    $this->redirect('admin/templates');
                } elseif ($command == 'add'){
                    if ($_POST){
                        $name = $this->form->getPost('name');
                        $ok = true;
                        foreach ($this->template->langs as $key => $lang){
                            if (!isset($_FILES["file_$lang->flag"])){
                                $ok = false;
                            }
                        }
                        if (strlen($name) >1 and $ok == true){
                            $allowedExts = array("docx");

                            $error = 0;
                            foreach ($_FILES as $file){
                                $temp = explode(".", $file['name']);
                                $ext = end($temp);
                                if (!in_array($ext, $allowedExts)){
                                    $ok = false;
                                }
                            }
                            if ($ok == true){
                                mkdir("/var/www/scripts/templates/$name");
                                chmod("/var/www/scripts/templates/$name", 0777);
                                foreach ($_FILES as $key => $file){
                                    $lang = substr($key, 5);
                                    $tempfile = "/var/www/scripts/templates/$name/$lang.docx";
                                    if (!move_uploaded_file($file['tmp_name'], $tempfile)){
                                        error_log('could not move ' . $file['tmp_name'] . ' to ' . $tempfile);
                                    }
                                    chmod($tempfile, 0777);
                                    mkdir("/var/www/scripts/templates/$name/$lang/template_$nights");
                                    chmod("/var/www/scripts/templates/$name/$lang/template_$nights", 0777);
                                    $dir = pathinfo($tempfile)['dirname'] . "/$lang";
                                    $output = shell_exec("sudo python2 scripts/manage_templates.py extract $tempfile -l $lang -o $dir". ' 2>&1');
                                    delete($tempfile);
                                    $this->setCurrentFlashmessage($this->lang['addedtemplate']);
                                    $this->template->render('admin/templates');
                                }
                            } else {
                                $this->setCurrentFlashmessage($this->lang['templatefileerror'], 'danger');
                                $this->template->render('admin/templates.add'); 
                            }
                        } else {
                            $this->setCurrentFlashmessage($this->lang['templateadderror'], 'danger');
                            $this->template->render('admin/templates.add');
                        }             
                    } else {
                        $this->template->render('admin/templates.add');
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
    {
        if ($this->checkPrivilege() == true){
            if (!$command or $command == false){
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