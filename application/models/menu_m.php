<?php

class Menu_m extends Core_db
{  
    public function getStartmenu()
    {
        $menuitems = array(
            array(
                'link' => 'home/index',
                'description' => $this->lang['start'],
            ),
        );
        return $menuitems;
    }
    
    public function getBeheerderMenu($lang)
    {
        $menuitems = array(
            array(
                'link' => 'admin/index',
                'description' => $lang['adminindex'],
            ),            
			array(
                'link' => 'admin/lists',
                'description' => $lang['adminlists'],
            ),
			array(
                'link' => 'admin/data',
                'description' => $lang['admindata'],
            ),
        );
        return $menuitems;
    }
    

}
