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
          $lang['users']        = 'Gebruikers';
          $lang['lists']        = 'Vragenlijsten';
          $lang['nousersyet']   = 'Er zijn nog geen gebruikers in de databank.';
          $lang['nolistsyet']   = 'Er zitten nog geen vragenlijsten in de databank.';
          $lang['addlist']      = 'VMaak nieuwe vragenlijst';
          $lang['addedlist']    = 'Lijst toegevoegd.';
          $lang['erroraddinglist'] = 'Fout bij het toevoegen van de lijst. Is de naam al gebruikt?';
          $lang['wronglistname']   = 'Gelieve een geldige lijstnaam te gebruiken.';
          $lang['wrongaction']  = 'Deze URL wordt niet herkent. (Foute actie)';
          $lang['addlist']      = 'Nieuwe vragenlijst';
          $lang['add']          = 'Voeg Toe';
          $lang['namenewlist']  = 'Naam nieuwe lijst';
          $lang['delete']       = 'Verwijder';
          $lang['listremoved']  = 'De vragenlijst is verwijdert.';
          $lang['pages']        = 'Pagina\'s';
          $lang['addpage']      = 'Nieuwe Pagina';
          $lang['nopagesyet']   = 'Er zijn nog geen pagina\'s voor deze lijst.';
          $lang['gobacktolist'] = '< Ga terug naar lijstnr. ';
          break;    

    }
    
    return $lang;
}
