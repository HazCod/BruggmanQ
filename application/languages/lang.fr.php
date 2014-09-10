<?php

function getLang($controller){
    //Change this to yes if this is for a language that reads from the right to the left.
    $lang['rtl'] = 'no';
    
    switch ($controller) {  
       //login page  
      case 'start':
        $lang['start']      = 'Pour commencer, choisissez votre langue et indiquez votre nom.';
        $lang['loggedout']  = 'Vous êtes déconnecté du système.';
        $lang['firstname']  = 'Prénom';
        $lang['lastname']   = 'Nom de famille';
        $lang['submit']     = 'Suivant';
        $lang['cancel']     = 'Annuler';
        $lang['wrongname']  = 'Indiquez un nom ou un prénom correct.';
        $lang['picklist']   = 'Choisissez le questionnaire que vous désirez importer.';
        $lang['page']       = 'Page';
        //-- error messages displayed at start page
        $lang['pagenotfound'] = 'Erreur : la page n’a pas été trouvée ou trop de pages ont le même numéro.';
        $lang['noquestions']  = 'Il n’y a pas de question disponible pour cette page.';
        $lang['next']         = 'Suivant';
        $lang['hasended']   = 'Le questionnaire est terminé.';
        $lang['thankyou']    = 'Merci d’avoir rempli ce questionnaire. Vous pouvez maintenant vous déconnecter en cliquant sur le bouton <b>logout</b> en haut à droite.';
        break;
    
      //survey pages 
      case 'lists':
          $lang['listnotfound'] = 'Erreur : le questionnaire n’a pas été trouvé.';
          $lang['page']         = 'Page';
          $lang['noquestions']  = 'Pas de question disponible.';
          break;
    
      //admin page
      case 'admin':
          $lang['accessdenied'] = 'Vous n’avez pas accès à cette page.';
          $lang['adminindex']   = 'Résumé';
          $lang['adminlists']   = 'Gestion des questionnaires';
          $lang['admindata']    = 'Gestion des données';
          $lang['users']        = 'Utilisateurs';
          $lang['lists']        = 'Questionnaires';
          $lang['nousersyet']   = 'Il n’y a pas encore d’utilisateur dans la base de données.';
          $lang['nolistsyet']   = 'Il n’y a pas encore de questionnaire dans la base de données';
          $lang['addlist']      = 'Créer un nouveau questionnaire';
          $lang['addedlist']    = 'La liste a été correctement ajoutée';
          $lang['erroraddinglist'] = 'Erreur : il y a eu une erreur lors de l’ajout du questionnaire. Le nom du questionnaire est-il déjà utilisé?';
          $lang['wronglistname']   = 'Veuillez utiliser une liste de nom valide';
          $lang['wrongaction']  = 'Erreur: cet URL n’est pas reconnu)';
          $lang['addlist']      = 'Nouveau questionnaire';
          $lang['add']          = 'Ajouter';
          $lang['namenewlist']  = 'Nom de la nouvelle liste';
          $lang['delete']       = 'Suppression';
          $lang['listremoved']  = 'Le questionnaire a été supprimé';
          $lang['pages']        = 'Page(s)';
          $lang['addpage']      = 'Nouvelle Page';
          $lang['nopagesyet']   = 'Il n’y a pas de page disponible pour cette liste';
          $lang['gobacktolists'] = '< Retourner à la liste récapitulative';
          $lang['wrongpagename']= 'Veuillez utiliser un nom correct de page';
          $lang['erroraddingpage'] = 'Erreur : Il y a une erreur lors de l’ajout de la page. Veuillez contrôler les paramètres.';
          $lang['pagetitle']    = 'Titre de la page';
          $lang['pagedescr']    = 'Description d’une page';
          $lang['addedpage']    = 'Votre page a été rajoutée';
          $lang['moveup']       = 'En haut';
          $lang['movedown']     = 'En bas';
          $lang['deletedpage']  = 'La page a été supprimée.';
          $lang['manage']       = 'Gestion';
          $lang['gobacktopage'] = '< Retourner à la page n° ';
          $lang['question']     = 'Question';
          $lang['questions']    = 'Questions';
          $lang['addquestion']  = 'Rajouter une question';
          $lang['noquestionsyet'] = 'Il n’y a pas encore de question pour cette page';
          $lang['addedquestion'] = 'Question ajoutée';
          $lang['erroraddingquestion'] = 'Erreur: il y a une erreur dans l’ajout de la question. Veuillez vérifier les paramètres.';
          $lang['newquestion']  = 'Nouvelle question';
          $lang['questiondescr'] = 'Questionnement';
          $lang['questiontype'] = 'Type de question';
          $lang['next']         = 'Continuer';
          $lang['answers']      = 'Répondre';
          $lang['deletedquestion'] = 'La question a été supprimée';
          $lang['manageanswers'] = 'Gestion des réponses';
          $lang['noanswersyet'] = 'Il n’y a pas encore de réponse dans la base de données pour cette question.';
          $lang['type']         = 'Type';
          $lang['addanswer']    = 'Ajouter une réponse';
          $lang['backtoquestion'] = 'Retourner à la question n° ';          
          $lang['newanswer']    = 'Nouvelle réponse';
          $lang['answerdescr']   = 'Veuillez inscrire votre réponse ici';
          $lang['addedanswer']  = 'Votre réponse a été ajoutée.';
          $lang['erroraddinganswer'] = 'Erreur: il y a une erreur lors de l’ajout de votre réponse. Veuillez contrôler vos paramètres';
          $lang['deletedanswer']    = 'La réponse a été supprimée';
          $lang['adminlangs']       = 'Langues';
          $lang['deletedlang']      = 'La langue a été supprimée';
          $lang['addlang']          = 'Ajouter une langue';
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
          $lang['areyousure']       = 'Bent u zeker?';
          $lang['code']             = 'Identificatiecode (voor het rapport)';
          $lang['langsnotice']      = 'Opmerking: Bij het toevoegen van een nieuwe taal mag u niet vergeten het template voor deze taal toe te voegen.';
          $lang['download']         = 'Download PSG';
          $lang['clear']            = 'Maak PSG leeg';
          $lang['regextool']        = 'RegEx Tool';
          $lang['regex']            = 'Regular Expression';
          $lang['input']            = 'Invoer';
          $lang['result']           = 'Resultaat';
          $lang['calculate']        = 'Bereken';
          $lang['occurence']        = 'Hoeveelste getal?';
          $lang['yes']              = 'Ja';
          $lang['no']               = 'Nee';
          $lang['addtoexcel']       = 'Voeg toe in GLS?';
          $lang['norm']             = 'Norm';
          $lang['stddev']           = 'Standaard deviatie';
          $lang['settings']         = 'Instellingen';
          $lang['parameters']       = 'Parameters';
          $lang['parameteradded']   = 'Parameter is toegevoegd.';
          $lang['regexlength']      = 'Aantal opeenvolgende (getallen tellen ook!)';
          $lang['regexleaveempty']  = 'Laat dit leeg voor getallen! Indien ingevuld, wordt de parameter als tekst behandelt.';
          $lang['downloadData']     = 'Download geconverteerde Data';
          
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
