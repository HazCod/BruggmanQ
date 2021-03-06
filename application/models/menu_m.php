<?php

class Menu_m extends Core_db
{  
    public function getStartmenu()
    {
        $menuitems = array(
            array(
                'link' => 'home/index',
                'description' => 'Start',
            ),
        );
        return $menuitems;
    }
    
    public function getSurveyMenu($lang, $nr=1 )
    {
        $menuitems = array(
            array(
                'link' => 'lists/page/' . $nr,
                'description' => $lang["page"] . ' ' . $nr,
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
            array( 'link' => array(
                                    array(
                                        'link' => 'admin/lists',
                                        'description' => $lang['adminlists'],
                                    ),
                                    array(
                                        'link' => 'admin/data',
                                        'description' => $lang['admindata'],
                                    ),
                              ),
                   'description' => $lang['manage'],
            ),
            array( 'link' => array(
                                    array(
                                        'link' => 'admin/langs',
                                        'description' => $lang['adminlangs'],
                                    ),
                                    array(
                                        'link' => 'admin/templates',
                                        'description' => 'Templates',
                                    ),
                                    array(
                                        'link' => 'admin/parameters',
                                        'description' => $lang['parameters'],
                                    )
                              ),
                   'description' => $lang['settings'],
            ),
        );
        return $menuitems;
    }
    

}
