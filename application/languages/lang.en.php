<?php

function getLang($controller){
   
    switch ($controller) {
      //login page
      case 'start':
        $lang['start']      = 'Please provide us with your details below.';
        $lang['loggedout']  = 'You have been logged out.';
        $lang['firstname']  = 'First name';
        $lang['lastname']   = 'Last name';
        $lang['submit']     = 'Continue';
        $lang['cancel']     = 'Cancel';
        $lang['wrongname']  = 'Please provide your name in a correct way.';
        $lang['accessdenied']='You don\'t have access to this page.';
        break;
        
      //admin page
      case 'admin':
          $lang['adminindex']   = 'Dashboard';
          $lang['adminlists']   = 'Manage Questionnaires';
          $lang['admindata']    = 'Manage data';
          break; 
    
    }
    return $lang;
}

?>