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
          $lang['nolangsyet']       = 'Il n’y a pas encore de langue dans le système.';
          $lang['addlang']          = 'Ajouter une langue';
          $lang['flagcode']         = 'Code de la langue pour le drapeau';
          $lang['flagcodedescr']    = 'Le code de la langue pour le drapeau se trouve dans : /img/flags/codedelalangue.png';
          $lang['erroraddinglang']  = 'Erreur: il y a eu une erreur dans l’ajout de la langue. Veuillez contrôler vos paramètres.';
          $lang['addedlang']        = 'La langue a été ajoutée';
          $lang['identifier']       = 'Code d’indentification';
          $lang['identifierdescr']  = 'Code d’identification de la réponse';
          $lang['extra']            = 'Paramètres extra';
          $lang['managedata']       = 'Gestion des données fournies';
          $lang['removeddata']      = 'Les données du patient ont été supprimées.';
          $lang['datalist']         = 'Liste des données d’utilisateurs';
          $lang['view']             = 'Voir';
          $lang['lastusers']        = 'Les derniers utilisateurs';
          $lang['generatereport']   = 'Générer un rapport';
          $lang['datafile']         = 'Fichiers de data compatibles (.RTF, .HTML ou text)';
          $lang['invalidfile']      = 'Erreur: le fichier n’est pas compatible. Votre fichier doit avoir l’extension .rtf, .html ou text.';
          $lang['fileexistant']     = 'les fichiers existent déjà sur le serveur mais ont été supprimés. Essayez encore une fois.';
          $lang['scripterror']      = 'Erreur : il y a une erreur dans l’ajout du script dans';
          $lang['report']           = 'Votre rapport';
          $lang['reportgenerating'] = "Votre rapport a été généré et a été enregistré dans votre browser internet. Veuillez patienter un peu.\n L’output va être affiché ci-dessous.";
          $lang['noparameter']      = 'Aucun paramètre n’a été introduit dans l’URL.';
          $lang['generatereport']   = 'Rapport';
          $lang['langs']            = 'Langues';
          $lang['nodatayet']        = 'Il n’y a pas encore de données dans le système';
          $lang['name']             = 'Nom';
          $lang['flagcodedescr']    = 'Code à deux chiffres pour la langue. (en, fr, nl, ..)';
          $lang['language']         = 'Langue';
          $lang['notemplates']      = 'Aucune template n’a été trouvée dans scripts/templates';
          $lang['templateremoved']  = 'La template a été ajoutée';
          $lang['uploadtemplate']   = 'Charger la template';
          $lang['templatelang']     = '(template_1, template_2, ...) 4 Templates pour les langues';
          $lang['templateadderror'] = 'Veuillez vérifier si vos paramètres, le nom et toutes les langues ont été rempliss.';
          $lang['templatefileerror']= 'Veuillez vérifier si la template est pas corrupte est le bon format.';
          $lang['addedtemplate']    = 'La template a été ajoutée.';
          $lang['newtemplate']      = 'Nouvelle template';
          $lang['templatereplaced'] = 'La template a été remplacée.';
          $lang['invalidtemplatename'] = 'Noms; template_1.docx, template_2.docx, ...';
          $lang['areyousure']       = 'Êtes-vous sûr?';
          $lang['code']             = ' Ceci est un menu déroulant où les utilisateurs peuvent choisir une valeur.';
          $lang['langsnotice']      = 'N\'oubliez pas d\'ajouter une template pour chaque langue.';
          $lang['download']         = 'Télécharger le PSG';
          $lang['clear']            = 'Effacer le PSG';
          $lang['regextool']        = 'RegEx Tool';
          $lang['regex']            = 'Regular Expression';
          $lang['input']            = 'Saisie';
          $lang['result']           = 'Résultat';
          $lang['calculate']        = 'Calculer';
          $lang['occurence']        = 'Nombre de chiffre?';
          $lang['yes']              = 'Oui';
          $lang['no']               = 'Non';
          $lang['addtoexcel']       = 'Ajouter au GLS?';
          $lang['norm']             = 'Norm';
          $lang['stddev']           = 'Deviation normal';
          $lang['settings']         = 'Options';
          $lang['parameters']       = 'Paramètres';
          $lang['parameteradded']   = 'Le paramètre a été ajouté.';
          $lang['regexlength']      = 'Nombre de ceux successifs (aussi les chiffres!)';
          $lang['regexleaveempty']  = 'Laissez ce champ vide pour les numéros! S\'il est achevé, le paramètre est traité comme texte.';
          $lang['downloadData']     = 'Télécharger les données converties';
          
          //- description of every type
          $lang['COMBOBOXdesc']  = 'Ceci est une liste avec des options à cocher.';
          $lang['RADIOBOXdesc']  = 'Ceci est un menu déroulant où les utilisateurs peuvent choisir une valeur.';
          $lang['CHECKBOXdesc']  = 'Ceci est un menu déroulant où les utilisateurs peuvent choisir une valeur.';
          $lang['TEXTINPUTdesc']  = 'Champ texte.';
          $lang['DATEINPUTdesc']  = 'Champ date.';
          $lang['NUMBERINPUTdesc']  = 'Champ chiffre.';
          break;  
      
      default: error_log('Lang info not found for controller ' . $controller);

    }
    
    return $lang;
}
