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
        
        $this->menu_m = Load::model('menu_m');
        $this->template->menuitems = $this->menu_m->getBeheerderMenu($this->lang);
		
	$this->template->setPagetitle('Bruggman');
    }

    public function index()
    {
        if (isset($_SESSION['admin'])) {
            $this->template->lists = $this->lists_m->getLists();
            $this->template->lastusers = $this->lists_m->getLastUsers();
            $this->template->render('admin/index');
        } else {
            $this->setFlashmessage($this->lang['accessdenied'], 'danger');
            $this->redirect('home/index');
        }
    }

}