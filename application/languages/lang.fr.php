<?php

function getLang($controller){
    //Change this to yes if this is for a language that reads from the right to the left.
    $lang['rtl'] = 'no';
    
    switch ($controller) {  
       //login page  
      case 'start':
        $lang['start']      = 'Please pick your language in the top right corner and fill in your name.';
        $lang['loggedout']  = 'You have been successfully logged out.';
        $lang['firstname']  = 'First name';
        $lang['lastname']   = 'Last name';
        $lang['submit']     = 'Continue';
        $lang['cancel']     = 'Cancel';
        $lang['wrongname']  = 'Please fill in your first and last name correctly.';
        $lang['picklist']   = 'Please pick your desired question list.';
        $lang['page']       = 'Page';
        //-- error messages displayed at start page
        $lang['pagenotfound'] = 'Error: No page available.';
        $lang['noquestions']  = 'No questions found for this page.';
        $lang['next']         = 'Next';
        $lang['hasended']   = 'The question list has ended.';
        $lang['thankyou']    = 'Thank you for filling in this questionnaire.<br>You may now logout by clicking <b>\'logout\'</b> in the top right corner.';
        break;
    
      //survey pages 
      case 'lists':
          $lang['listnotfound'] = 'Error: questionnaire not found.';
          $lang['page']         = 'Page';
          $lang['noquestions']  = 'No questions available.';
          break;
    
      //admin page
      case 'admin':
          $lang['accessdenied'] = 'You don\'t have access to this page.';
          $lang['adminindex']   = 'Overview';
          $lang['adminlists']   = 'Manage questionnaires';
          $lang['admindata']    = 'Manage data';
          $lang['users']        = 'Users';
          $lang['lists']        = 'Questionnaires';
          $lang['nousersyet']   = 'There aren\'t any users yet in the database.';
          $lang['nolistsyet']   = 'There aren\'t any questionnaires yet in the database.';
          $lang['addlist']      = 'Create new questionnaire';
          $lang['addedlist']    = 'Questionnaire added.';
          $lang['erroraddinglist'] = 'Erorr while adding questionnaire. Is the name already in use?';
          $lang['wronglistname']   = 'Please use a valid list name.';
          $lang['wrongaction']  = 'This URL is not recognized. (Wrong action)';
          $lang['addlist']      = 'New Questionnaire';
          $lang['add']          = 'Add';
          $lang['namenewlist']  = 'Name new list';
          $lang['delete']       = 'Delete';
          $lang['listremoved']  = 'The questionnaire has been removed.';
          $lang['pages']        = 'Page\'s';
          $lang['addpage']      = 'New Page';
          $lang['nopagesyet']   = 'There aren\'t any Pages yet for this questionnaire.';
          $lang['gobacktolists'] = '< Go back to questionnaire overview. ';
          $lang['wrongpagename']= 'Please provide a valid Page name.';
          $lang['erroraddingpage'] = 'Error while adding Page. Please check your parameters.';
          $lang['pagetitle']    = 'Page title';
          $lang['pagedescr']    = 'Page description';
          $lang['addedpage']    = 'Page has been added.';
          $lang['moveup']       = 'Up';
          $lang['movedown']     = 'Down';
          $lang['deletedpage']  = 'Page has been removed.';
          $lang['manage']       = 'Manage';
          $lang['gobacktopage'] = '< Go back to Pagenr. ';
          $lang['question']     = 'Question';
          $lang['questions']    = 'Questions';
          $lang['addquestion']  = 'Add Question';
          $lang['noquestionsyet'] = 'There aren\'t any Questions yet for this Page.';
          $lang['addedquestion'] = 'Question has been added.';
          $lang['erroraddingquestion'] = 'Error while adding Question. Please check your parameters.';
          $lang['newquestion']  = 'New Question';
          $lang['questiondescr'] = 'The Question description';
          $lang['questiontype'] = 'Question Type';
          $lang['next']         = 'Continue';
          $lang['answers']      = 'Answers';
          $lang['deletedquestion'] = 'Answer has been removed.';
          $lang['manageanswers'] = 'Manage Answers';
          $lang['noanswersyet'] = 'No answers have been found for this Question.';
          $lang['type']         = 'Type';
          $lang['addanswer']    = 'Add Answer';
          $lang['backtoquestion'] = 'Go back to Question nr. ';          
          $lang['newanswer']    = 'New Answer';
          $lang['answerdescr']   = 'Answer Description';
          $lang['addedanswer']  = 'Your answer has been added.';
          $lang['erroraddinganswer'] = 'Error while adding Answer. Please check your parameters.';
          $lang['deletedanswer']    = 'Answer has been removed.';
          $lang['adminlangs']       = 'Languages';
          $lang['deletedlang']      = 'Language has been removed.';
          $lang['addlang']          = 'Add Language';
          $lang['nolangsyet']       = 'No languages yet in the database. Add one now!';
          $lang['addlang']          = 'Add Language';
          $lang['flagcode']         = 'Languagecode (for flag icon and URL) (two letters)';
          $lang['flagcodedescr']    = 'Language code for flag. Image resides in /img/flags/taalcode.png';
          $lang['erroraddinglang']  = 'Error while adding language. Please check your parameters.';
          $lang['addedlang']        = 'Language has been added.';
          $lang['identifier']       = 'Identification code';
          $lang['identifierdescr']  = 'Identification code of the answer.';
          $lang['extra']            = 'Extra parameters';
          $lang['managedata']       = 'Manage Data';
          $lang['removeddata']      = 'User Data has been removed.';
          $lang['datalist']         = 'Datalist of user.';
          $lang['view']             = 'View';
          $lang['lastusers']        = 'Last Users';
          $lang['generatereport']   = 'Generate Report';
          $lang['datafile']         = 'Data file (.RTF, .HTML or text)';
          $lang['invalidfile']      = 'Invalid file! Has to be text, HTML or RTF.';
          $lang['fileexistant']     = 'File was already existant on the server and has been removed. Please try again.';
          $lang['scripterror']      = 'Erorr while executing script at script/readout_data.py';
          $lang['report']           = 'Your Report';
          $lang['reportgenerating'] = "Your report is being generated and a Download button will appear. Please wait..\nThe output will be shown for logging purposes.";
          $lang['noparameter']      = 'No parameter given in URL.';
          $lang['generatereport']   = 'Report';
          $lang['langs']            = 'Languages';
          $lang['nodatayet']        = 'No data found yet in the system.';
          $lang['name']             = 'Name';
          $lang['flagcodedescr']    = 'Two-character code for language. (eg. en, fr, nl, ..)';
          $lang['language']         = 'Language';
          $lang['notemplates']      = 'No templates found in in scripts/templates !! Please add one!';
          $lang['templateremoved']  = 'Template has been removed.';
          $lang['uploadtemplate']   = 'Upload Template';
          $lang['templatelang']     = '(template_1, template_2, ...) 4 Templates for language ';
          $lang['templateadderror'] = 'Please check that the name &amp; and all parameters are filled in.';
          $lang['templatefileerror']= 'Please check for all files to be given and for corrupt files.';
          $lang['addedtemplate']    = 'Template has been added.';
          $lang['newtemplate']      = 'New Template file';
          $lang['templatereplaced'] = 'Template has been replaced by your new one.';
          $lang['invalidtemplatename'] = 'Naming convention; template_1.docx, template_2.docx, ...';
          $lang['areyousure']       = 'Are you sure?';
          $lang['code']             = 'Identification code (for the report)';
          $lang['langsnotice']      = '';
           //- description of every type
          $lang['COMBOBOXdesc']  = 'This is a dropdown where people can pick one value.';
          $lang['RADIOBOXdesc']  = 'This is a list of bullets where people can choose one item.';
          $lang['CHECKBOXdesc']  = 'This is a list of items where people can pick none to many items.';
          $lang['TEXTINPUTdesc']  = 'A textfield where people can input text..';
          $lang['DATEINPUTdesc']  = 'A date input field.';
          $lang['NUMBERINPUTdesc']  = 'Number input field.';
          $lang['MESSAGEdesc']    = 'A block of text that will be displayed.';
          $lang['TIMEINPUTdecs']  = 'Let people choose an hour/minutes combination.';
          $lang['LINEINPUTdesc']  = 'Let people write a couple of words in a box.';
          break;  
      
      default: error_log('Lang info not found for controller ' . $controller);

    }
    
    return $lang;
}
