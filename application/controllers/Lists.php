<?php
class Lists extends Core_controller
{
    public function __construct()
    {
        parent::__construct('start');

        $this->template->setPartial('navbar')
            ->setPartial('headermeta')
            ->setPartial('footer')
            ->setPartial('flashmessage');

        $this->menu_m = Load::model('menu_m');
        $this->langs_m = Load::model('langs_m');
        $this->lists_m = Load::model('lists_m');
        $this->page_m = Load::model('page_m');
        $this->questions_m = Load::model('questions_m');
        $this->answers_m = Load::model('answers_m');
        $this->data_m = Load::model('data_m');
        
        $this->template->langs = $this->langs_m->getLangs();        

        if (isset($_SESSION['currentpage'])){ //Are we busy completing a page?
            $this->template->menuitems = $this->menu_m->getSurveyMenu($this->lang, $_SESSION['currentpage']);
        } else {
            $this->template->menuitems = $this->menu_m->getSurveyMenu($this->lang, '1');
        }
        $this->template->setPagetitle('Brugmann');	
    }
    
    function getTypeStr($arr, $typenr){
    // Returns the type for the given id
        $result = false;
        for ($i=0; $i < sizeof($arr) and $result == false; $i++){
            if ($arr[$i]->id == $typenr){
                $result = $arr[$i]->type;
            }
        }
        if ($result == false){
            $result = '???(' . $typenr . ')';
        }
        return $result;
    }
    
    function isOptionQuestion($questions, $q){
    // Looks if the given question is one with an optionlist
        $result = false;
        for ($i=0; $i < sizeof($questions) and $result == false; $i++){
            if ($questions[$i]->question == $q){
                $result = true;
            }
        }
        return $result;
    }
    
    public function page($nr=1){
       if (isset($_SESSION['user']) and ($nr == intval($nr))){
            if ($nr == 1){ //If the currentpage SESSION variable isnt set, set it to the first page
                $_SESSION['currentpage'] = $nr;
            }
            $page = $this->page_m->getPageByNr($_SESSION['list'], $nr); //Get the page object for the current page
            if ($page){ //Does it exist?
                //- Check if we did the previous pages
                if ((intval($_SESSION['currentpage']) == intval($nr + 1)) or ($nr == 1)){
                    if ($_POST){ //Are we posting the answers or just displaying the questions?
                        if (!isset($_POST['skip'])){ //Skip page? (no questions available)
                            $formdata = $this->form->getPost();
                            $user = $this->data_m->getUserByName($_SESSION['user']); //get user object for current user
                            if (!$user){ //first time user
                                $ename = explode('_', $_SESSION['user']); //get first and last name
                                $this->data_m->addUser($ename[0], $ename[1]); //Insert our first time user
                                $user = $this->data_m->getUserByName($_SESSION['user']); //Return the user object (for the id etc)
                            }
                            $questions = $this->answers_m->getQuestionsWithAnswers(); //Get the current questions + answers
                            foreach ($formdata as $q_id => $answer){ //loop them
                                if ($this->isOptionQuestion($questions, $q_id)){ //Answer based on available options?
                                    if (is_array($answer)){ //Is this an optionlist?
                                        foreach ($answer as $q_){ 
                                            $this->data_m->addData($user->id, $q_id, $q_, null); //add them to the db
                                        }
                                    } else {
                                        $this->data_m->addData($user->id, $q_id, $answer, null); //add the answer to the db
                                    }
                                } else { //Custom answer
                                    $this->data_m->addData($user->id, $q_id, null, $answer);
                                }
                            }
                        }
                        $nextpage = $this->page_m->getPageByNr($_SESSION['list'], intval($nr) + 1); //Get the next page
                        if ($nextpage){ //Does the next page exist? If not, survey has ended.
                            $_SESSION['currentpage'] = $nextpage->nr;
                            $this->redirect('lists/page/' . $nextpage->nr);
                        } else {
                            $this->redirect('home/end');
                        }
                    } else { //Show the page
                        $this->template->pagenr    = $nr;
                        $this->template->page      = $page;
                        $this->template->pagestotal= intval($this->page_m->getAmountOfPages($page->questionlist)->pages);               
                        $m_questions = $this->questions_m->getQuestions($page->id);
                        if ($m_questions){ //Are there any questions for this page?
                            $types = $this->questions_m->getTypes();
                            $questions = array();
                            foreach ($m_questions as $item => $question){
                                $questions[] = array(
                                    'nr' => $question->nr,
                                    'id' => $question->id,
                                    'type' => $this->getTypeStr($types, $question->type),
                                    'question' => $question->question,
                                    'answers' => $this->answers_m->getAnswers($question->id),
                                    'extra' => $question->extra,
                                );
                            }
                            $this->template->questions = $questions;
                        }
                        $this->template->setPagetitle($page->title . ' - Brugmann');
                        $this->template->render('lists/page');
                    }
                } else {
                    $this->redirect('lists/page/' . $_SESSION['currentpage']);
                }
            } else { //Page not found. They tried to do something bad, unset the list to be sure.
                unset($_SESSION['list']);
                $this->setFlashmessage($this->lang['pagenotfound'], 'danger');
                $this->redirect('home/index');
            }
        } else {
            $this->redirect('home/index');
        }
    }

    public function index($nr=false)
    {
        if (isset($_SESSION['user']) and $nr != false and $nr == intval($nr)) { //user info filled in
            $list = $this->lists_m->getList($nr); //get list SESSION variable
            if ($list){ //Are they already completing a list?
                $_SESSION['list'] = $nr; //Set the page nr to list VARIABLE
                if (isset($_SESSION['currentpage'])){ //we have already done page(s)
                    $this->redirect('lists/page/' . $_SESSION['currentpage']); //Go t the next page
                } else {
                    $this->redirect('lists/page'); //Go to first page
                }
            } else { //List not found!
                $this->setFlashmessage($this->lang['listnotfound'], 'danger');
                $this->redirect('home/index');
            }
        } else {
            $this->redirect('home/index');
        }
    }

}
