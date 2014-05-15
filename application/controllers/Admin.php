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
        
        $this->menu_m = Load::model('menu_m');
        $this->template->menuitems = $this->menu_m->getBeheerderMenu($this->lang);
		
	$this->template->setPagetitle('Bruggman');
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

    public function index()
    {
        if ($this->checkPrivilege() == true){
            $this->template->lists = $this->lists_m->getLists();
            $this->template->lastusers = $this->lists_m->getLastUsers(10);
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
    
    
    public function answers($question, $command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if ($question){
               if (!$command or $command == false){
                    $this->template->questions = $this->questions_m->getQuestions($page);
                    $this->template->types = $this->questions_m->getTypes();
                    $this->template->question = $this->questions_m->getQuestion($question);
                    $this->template->render('admin/questions.answers');
                } 
            } else {
               $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
               $this->template->render('admin/index');   
            }
        }
    }
    
    public function questions($page, $command=false, $par1=false)
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
                        if (!$formdata->nr){
                            $formdata->nr = 0;
                        }
                        if ($this->form->isFormValid()){
                            $this->setFlashmessage($this->lang['addedquestion']);
                            $this->questions_m->addQuestion($formdata->descr, $formdata->type, null, $formdata->nr, $page);
                            $this->redirect('admin/questions/' . $page);
                        } else {
                            $this->setCurrentFlashmessage($this->lang['erroraddingquestion'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->page = $page;
                            $this->template->render('admin/questions.add');
                        }
                    } else {
                        $this->template->questions = $this->questions_m->getQuestions($list);
                        $this->template->types = $this->questions_m->getTypes();
                        $this->template->page = $page;
                        $this->template->render('admin/questions.add');
                    }
                } elseif ($command == 'delete') {
                    $this->questions_m->deleteQuestion($par1);
                    $this->setFlashmessage($this->lang['deletedquestion']);
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'up'){
                    //TODO
                    $this->redirect('admin/questions/' . $page);
                } elseif ($command == 'down'){
                    //TODO
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
    
    public function pages($list, $command=false, $par1=false)
    {
        if ($this->checkPrivilege() == true){
            if ($list){
                if (!$command or $command == false){
                    //Show all pages of list $list
                    $this->template->pages = $this->lists_m->getPages($list);
                    $this->template->list = $list;
                    $this->template->render('admin/pages');
                } else if ($command == 'add'){
                    if ($_POST){
                        $formdata = $this->form->getPost();
                        $this->form->validateLength('pagename', 3);
                        $this->form->validateLength('descr', 3);
                        if (!$formdata->nr){
                            $formdata->nr = 0;
                        }
                        if ($this->form->isFormValid()){
                            $this->lists_m->addPage($formdata->pagename, $list, $formdata->descr, $formdata->nr);
                            $this->setFlashmessage($this->lang['addedpage']);
                            $this->redirect('admin/pages/' . $list);
                        } else {
                            $this->setCurrentFlashmessage($this->lang['erroraddingpage'], 'danger');
                            $this->template->formdata = $formdata;
                            $this->template->list = $list;
                            $this->template->render('admin/lists.add');
                        }
                    } else {
                        $this->template->pages = $this->lists_m->getPages($list);
                        $this->template->list = $list;
                        $this->template->render('admin/pages.add');
                    }
                } elseif ($command == 'delete'){
                    $this->lists_m->removePage($par1);
                    $this->setFlashmessage($this->lang['deletedpage']);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'up'){
                    $this->lists_m->movePageUp($par1);
                    $this->redirect('admin/pages/' . $list);
                } elseif ($command == 'down'){
                    $this->lists_m->movePageDown($par1);
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
                                $this->lists_m->addList($formdata->listname);
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
                }else {
                    $this->setCurrentFlashmessage($this->lang['wrongaction'], 'danger');
                    $this->template->render('admin/lists');
                }
            }
        }
    }

}