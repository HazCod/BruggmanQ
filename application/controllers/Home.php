<?php

class Home extends Core_controller
{
    public function __construct()
    {
        parent::__construct('start');

        $this->template->setPartial('navbar')
            ->setPartial('headermeta')
            ->setPartial('footer')
            ->setPartial('flashmessage');

        $this->menu_m = Load::model('menu_m');
        $this->langs_m = Load::model('langs_m');
        $this->lists_m = Load::model('lists_m');
        $this->template->menuitems = $this->menu_m->getStartMenu();
        $this->template->langs = $this->langs_m->getLangs();

        $this->template->setPagetitle('Bruggman');	
    }

    public function index()
    {
        if (isset($_SESSION['user'])) {
            if (isset($_SESSION['list'])){
                $this->redirect('lists/index/' . $_SESSION['list']);
            } else {
                $this->template->lists = $this->lists_m->getListsbyLang($_SESSION['lang']);
                $this->template->render('home/lists');
            }
        } else {
            $this->template->render('home/index');
        }
    }

    public function login()
    {
        $formdata = $this->form->getPost();

        $this->form->validateLength('firstname', 2);
        $this->form->validateLength('lastname', 2);
        
        if ($this->form->isFormValid()) { //               0Bruggm4n!
            if ($formdata->firstname == 'admin' && sha1($formdata->lastname) == 'fa1d114b1dd640af7dde6eeeb922808ab6336ee9'){
                $_SESSION['admin'] = '1';
                $this->redirect('admin/index');
            } else {
                $_SESSION['user'] = $formdata->firstname . '_' . $formdata->lastname;
                $this->redirect('home');
            }
        } else {
            $this->template->formdata = $formdata;
            $this->setCurrentFlashmessage($this->lang['wrongname'], 'danger');
            $this->template->render('home/index');
        }
    }
    
    public function end()
    {
        $this->template->render('home/end');
    }

    public function logout()
    {
        session_unset();
        $this->setFlashmessage($this->lang['loggedout']);
        $this->redirect("home");
    }


}
