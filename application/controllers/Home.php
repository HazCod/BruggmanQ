<?php

class Home extends Core_controller
{
    public function __construct()
    {
        parent::__construct('start');
        //set our partials in the template
        $this->template->setPartial('navbar')
            ->setPartial('headermeta')
            ->setPartial('footer')
            ->setPartial('flashmessage');
        //load models
        $this->menu_m = Load::model('menu_m');
        $this->langs_m = Load::model('langs_m');
        $this->lists_m = Load::model('lists_m');
        $this->template->menuitems = $this->menu_m->getStartMenu();
        $this->template->langs = $this->langs_m->getLangs();
        //set page title
        $this->template->setPagetitle('Brugmann');	
    }

    public function index()
    {
        if (isset($_SESSION['user'])) { //if we are already doing the survey
            if (isset($_SESSION['list'])){ //if we are completing a list
                $this->redirect('lists/index/' . $_SESSION['list']); //go to the list
            } else { //else, show us a list of lists (pun intended)
                $this->template->lists = $this->lists_m->getListsbyLang($_SESSION['lang']);
                $this->template->render('home/lists');
            }
        } else { //Not doing anything yet, show the login screen
            $this->template->render('home/index');
        }
    }

    public function login()
    {
        $formdata = $this->form->getPost();//get post data
        //Make sure data isn't empty
        $this->form->validateLength('firstname', 2);
        $this->form->validateLength('lastname', 2);
        //if everything is validated..
        if ($this->form->isFormValid()) { //               0Bruggm4n!
            if ($formdata->firstname == 'admin' && sha1($formdata->lastname) == 'fa1d114b1dd640af7dde6eeeb922808ab6336ee9'){
                $_SESSION['admin'] = '1'; //We are admin!
                $this->redirect('admin/index');
            } else {
                $_SESSION['user'] = $formdata->firstname . '_' . $formdata->lastname; //For later, save it
                $this->redirect('home');
            }
        } else { //You missed something
            $this->template->formdata = $formdata;
            $this->setCurrentFlashmessage($this->lang['wrongname'], 'danger');
            $this->template->render('home/index');
        }
    }
    
    public function end()
    { //You completed the survey! Show the "thank you" screen.
        $this->template->render('home/end');
    }

    public function logout()
    { //Unset all variables in memory and redirect to login
        session_unset();
        $this->setFlashmessage($this->lang['loggedout']);
        $this->redirect("home");
    }


}
