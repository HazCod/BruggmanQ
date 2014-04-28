<?php

function getLang($controller){
   
    switch ($controller) {
      //login page
      case 'start':
        $lang['start']      = 'Om te beginnen, voer hier uw naam in.';
        $lang['loggedout']  = 'U bent uitgelogd.';
        $lang['firstname']  = 'Voornaam';
        $lang['lastname']   = 'Achternaam';
        $lang['submit']     = 'Ga Verder';
        $lang['cancel']     = 'Annuleer';
        $lang['wrongname']  = 'Gelieve uw naam/voornaam correct in te geven.';
        $lang['accessdenied']='U hebt geen toegang tot deze pagina.';
        break;
    
      //admin page
      case 'admin':
          $lang['adminindex']   = 'Overzicht';
          $lang['adminlists']   = 'Beheer vragenlijsten';
          $lang['admindata']    = 'Beheer data';
          break;    

    }
    
    return $lang;
}
