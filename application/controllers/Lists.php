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

        if (isset($_SESSION['currentpage'])){
            $this->template->menuitems = $this->menu_m->getSurveyMenu($this->lang, $_SESSION['currentpage']);
        } else {
            $this->template->menuitems = $this->menu_m->getSurveyMenu($this->lang, '1');
        }

        $this->template->setPagetitle('Brugmann');	
    }
    
    function getTypeStr($arr, $typenr){
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
            if ($nr == 1){
                $_SESSION['currentpage'] = $nr;
            }
            $page = $this->page_m->getPageByNr($_SESSION['list'], $nr);
            if ($page){
                if ($_POST){
                    if (!isset($_POST['skip'])){
                        $formdata = $this->form->getPost();
                        $user = $this->data_m->getUserByName($_SESSION['user']);
                        if (!$user){ //first time user
                            //var_dump($_SESSION['user']); quit();
                            $ename = explode('_', $_SESSION['user']);
                            $this->data_m->addUser($ename[0], $ename[1]);
                            $user = $this->data_m->getUserByName($_SESSION['user']);
                            $_SESSION['user'] = $user->id;
                        }
                        $questions = $this->answers_m->getQuestionsWithAnswers();
                        foreach ($formdata as $q_id => $answer){
                            if ($this->isOptionQuestion($questions, $q_id)){ //Answer using a given option
                                if (is_array($answer)){
                                    foreach ($answer as $q_){
                                        $this->data_m->addData($user->id, $q_id, $q_, null);
                                    }
                                } else {
                                    $this->data_m->addData($user->id, $q_id, $answer, null);
                                }
                            } else { //Custom answer
                                $this->data_m->addData($user->id, $q_id, null, $answer);
                            }
                        }
                    }
                    $nextpage = $this->page_m->getPageByNr($_SESSION['list'], intval($nr) + 1);
                    if ($nextpage){
                        $_SESSION['currentpage'] = $nextpage->nr;
                        $this->redirect('lists/page/' . $nextpage->nr);
                    } else {
                        $this->redirect('home/end');
                    }
                } else {
                    $this->template->pagenr    = $nr;
                    $this->template->page      = $page;
                    $this->template->pagestotal= intval($this->page_m->getAmountOfPages($page->questionlist)->pages);               
                    $m_questions = $this->questions_m->getQuestions($page->id);
                    if ($m_questions){
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
                    $this->template->render('lists/page');
                }
            } else {
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
            $list = $this->lists_m->getList($nr);
            if ($list){
                $_SESSION['list'] = $nr;
                if (isset($_SESSION['currentpage'])){ //we have already done page(s)
                    $this->redirect('lists/page/' . $_SESSION['currentpage']);
                } else { //first pagesession_unset();
                    $this->redirect('lists/page');
                }
            } else {
                $this->setFlashmessage($this->lang['listnotfound'], 'danger');
                $this->redirect('home/index');
            }
        } else {
            $this->redirect('home/index');
        }
    }

}
