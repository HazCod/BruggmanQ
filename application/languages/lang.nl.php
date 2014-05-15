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
          $lang['wrongpagename']= 'Gelieve een correcte pagina naam te gebruiken.';
          $lang['erroraddingpage'] = 'Fout bij het toevoegen van de pagina. Controleer uw parameters.';
          $lang['pagetitle']    = 'Paginatitel';
          $lang['pagedescr']    = 'Beschrijving van de pagina.';
          $lang['addedpage']    = 'Uw pagina is toegevoegd.';
          $lang['moveup']       = 'Boven';
          $lang['movedown']     = 'Beneden';
          $lang['deletedpage']  = 'Pagina verwijdert.';
          $lang['manage']       = 'Beheer';
          $lang['gobacktopage'] = '< Ga terug naar paginanr. ';
          $lang['questions']    = 'Vragen';
          $lang['addquestion']  = 'Voeg vraag toe';
          $lang['noquestionsyet'] = 'Er zijn nog geen vragen voor deze pagina. ';
          $lang['addedquestion'] = 'Vraag toegevoegd.';
          $lang['erroraddingquestion'] = 'Fout bij het toevoegen van de vraag. Controleer uw parameters.';
          $lang['newquestion']  = 'Nieuwe Vraag';
          $lang['questiondescr'] = 'De vraagstelling.';
          $lang['questiontype'] = 'Type van Vraag';
          $lang['next']         = 'Ga Verder';
          $lang['answers']      = 'Antwoorden';
          $lang['deletedquestion'] = 'De vraag is verwijdert.';
          $lang['manageanswers'] = 'Beheer de antwoorden';
          $lang['noanswersyet'] = 'Er zitten nog geen antwoorden in de databank voor deze vraag.';
          $lang['type']         = 'Type';
          $lang['addanswer']    = 'Voeg antwoord toe';
          
          //- description of every type
          $lang['COMBOBOXdesc']  = 'Dit is een dropdown-menu waar mensen 1 waarde kunnen uitkiezen.';
          $lang['RADIOBOXdesc']  = 'Dit is een lijst van opties met bolletjes om 1 waarde uit te kiezen.';
          $lang['CHECKBOXdesc']  = 'Dit is een lijst van opties waar mensen geen of meerdere waardes kunnen uitkiezen.';
          $lang['TEXTINPUTdesc']  = 'Een tekstveld waar mensen iets in kunnen invullen.';
          $lang['DATEINPUTdesc']  = 'Een inputveld voor een datum.';
          $lang['NUMBERINPUTdesc']  = 'Een inputveld voor een getal.';
          break;    

    }
    
    return $lang;
}
