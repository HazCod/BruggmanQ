<?php

function getLang($controller){
    //Change this to yes if this is for a language that reads from the right to the left.
    $lang['rtl'] = 'no';
    
    switch ($controller) {  
       //login page  
      case 'start':
        $lang['start']      = 'Om te beginnen, kies rechtsboven uw taal en voer hier uw naam in.';
        $lang['loggedout']  = 'U bent uitgelogd.';
        $lang['firstname']  = 'Voornaam';
        $lang['lastname']   = 'Achternaam';
        $lang['submit']     = 'Ga Verder';
        $lang['cancel']     = 'Annuleer';
        $lang['wrongname']  = 'Gelieve uw naam/voornaam correct in te geven.';
        $lang['picklist']   = 'Kies hieronder de vragenlijst die u wilt afnemen.';
        $lang['page']       = 'Pagina';
        //-- error messages displayed at start page
        $lang['pagenotfound'] = 'Fout: Pagina niet gevonden. (of meerdere pagina\'s met zelfde nr.)';
        $lang['noquestions']  = 'Geen vragen beschikbaar voor deze pagina.';
        $lang['next']         = 'Volgende';
        $lang['hasended']   = 'De vragenlijst is beëindigd.';
        $lang['thankyou']    = 'Dank u voor het invullen van deze vragenlijst.<br>U mag zich nu uitloggen door op de knop <b>\'Logout\'</b> te drukken rechtsboven.';
        break;
    
      //survey pages 
      case 'lists':
          $lang['listnotfound'] = 'Fout: Vragenlijst niet gevonden.';
          $lang['page']         = 'Pagina';
          $lang['noquestions']  = 'Geen vragen beschikbaar.';
          break;
    
      //admin page
      case 'admin':
          $lang['accessdenied']='U hebt geen toegang tot deze pagina.';
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
          $lang['gobacktolists'] = '< Ga terug naar lijstoverzicht. ';
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
          $lang['question']     = 'Vraag';
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
          $lang['backtoquestion'] = 'Ga terug naar vraagnr. ';          
          $lang['newanswer']    = 'Nieuw antwoord';
          $lang['answerdescr']   = 'Hier komt uw antwoord.';
          $lang['addedanswer']  = 'Uw antwoord is toegevoegd.';
          $lang['erroraddinganswer'] = 'Fout bij het toevoegen van uw antwoord. Controleer uw parameters.';
          $lang['deletedanswer']    = 'Antwoord is verwijdert.';
          $lang['adminlangs']       = 'Talen';
          $lang['deletedlang']      = 'Taal is verwijdert.';
          $lang['addlang']          = 'Voeg taal toe';
          $lang['nolangsyet']       = 'Er zitten nog geen talen in het systeem.';
          $lang['addlang']          = 'Voeg taal toe';
          $lang['flagcode']         = 'Taalcode voor vlaggetje';
          $lang['flagcodedescr']    = 'Taalcode voor vlaggetje, dit bevindt zich in /img/flags/taalcode.png';
          $lang['erroraddinglang']  = 'Fout bij het toevoegen van een Taal. Controleer uw parameters.';
          $lang['addedlang']        = 'Taal is toegevoegd';
          $lang['identifier']       = 'Identificatiecode';
          $lang['identifierdescr']  = 'Identificatiecode van het antwoord.';
          $lang['extra']            = 'Extra parameters';
          $lang['managedata']       = 'Beheer ingegeven data';
          $lang['removeddata']      = 'Data van gebruiker is verwijdert.';
          $lang['datalist']         = 'Datalijst van gebruiker';
          $lang['view']             = 'Bekijk';
          $lang['lastusers']        = 'Laatste gebruikers';
          $lang['generatereport']   = 'Genereer Rapport';
          $lang['datafile']         = 'Databestand (.RTF, .HTML of text)';
          $lang['invalidfile']      = 'Ongeldig bestand! Moet text, HTML of RTF zijn.';
          $lang['fileexistant']     = 'Bestand bestond al op de server en is verwijdert. Probeer nog eens.';
          $lang['scripterror']      = 'Fout bij het uitvoeren van het Script in script/readout_data.py';
          $lang['report']           = 'Uw Rapport';
          $lang['reportgenerating'] = "Uw rapport wordt gegenereerd &amp; en gedownload in u webbrowser. Gelieve even te wachten...\nDe output wordt hieronder weergegeven.";
          $lang['noparameter']      = 'Geen parameter meegegeven in de URL.';
          $lang['generatereport']   = 'Rapport';
          $lang['langs']            = 'Talen';
          $lang['nodatayet']        = 'Nog geen data in het systeem';
          $lang['name']             = 'Naam';
          $lang['flagcodedescr']    = 'Tweecijferige code voor de taal. (bv. en, fr, nl, ..)';
          $lang['language']         = 'Taal';
          $lang['notemplates']      = 'Geen templates gevonden in scripts/templates !!';
          $lang['templateremoved']  = 'Template is verwijdert.';
          $lang['uploadtemplate']   = 'Template uploaden';
          $lang['templatelang']     = '(template_1, template_2, ...) 4 Templates voor taal';
          $lang['templateadderror'] = 'Gelieve uw parameters te checken en dat de naam en alle talen ingevuld is.';
          $lang['templatefileerror']= 'Gelieve te checken of al uw bestanden niet corrupt zijn en in het juiste formaat.';
          $lang['addedtemplate']    = 'Template is toegevoegd.';
          $lang['newtemplate']      = 'Nieuw Templatebestand';
          $lang['templatereplaced'] = 'Template is vervangen door het nieuwe bestand.';
          $lang['invalidtemplatename'] = 'Benaming; template_1.docx, template_2.docx, ...';
           //- description of every type
          $lang['COMBOBOXdesc']  = 'Dit is een dropdown-menu waar mensen 1 waarde kunnen uitkiezen.';
          $lang['RADIOBOXdesc']  = 'Dit is een lijst van opties met bolletjes om 1 waarde uit te kiezen.';
          $lang['CHECKBOXdesc']  = 'Dit is een lijst van opties waar mensen geen of meerdere waardes kunnen uitkiezen.';
          $lang['TEXTINPUTdesc']  = 'Een tekstveld waar mensen iets in kunnen invullen.';
          $lang['DATEINPUTdesc']  = 'Een inputveld voor een datum.';
          $lang['NUMBERINPUTdesc']  = 'Een inputveld voor een getal.';
          break;  
      
      default: error_log('Lang info not found for controller ' . $controller);

    }
    
    return $lang;
}
