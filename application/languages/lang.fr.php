<?php

function getLang($controller){
   
    switch ($controller) {
      //login page
      case 'start':
        $lang['start']      = 'Pour commencer, entrez votre nom ici.';
        $lang['loggedout']  = 'U bent uitgelogd.';
        $lang['firstname']  = 'Votre prénom';
        $lang['lastname']   = 'Votre nom de famille';
        $lang['submit']     = 'Continuez';
        $lang['cancel']     = 'Annuler';
        $lang['wrongname']  = 'Gelieve uw naam/voornaam correct in te geven.';
        $lang['accessdenied']='U hebt geen toegang tot deze pagina.';
        break;
    
      //admin page
      case 'admin':
          $lang['adminindex']   = 'Enquête';
          $lang['adminlists']   = 'Gestion des listes';
          $lang['admindata']    = 'Gestion des données';
          break; 

    }
    return $lang;
}

?>