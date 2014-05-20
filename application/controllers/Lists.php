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
    
    public function page($nr=1){
        if (isset($_SESSION['user'])){
            if ($nr == 1){
                $_SESSION['currentpage'] = $nr;
            }
            $page = $this->page_m->getPageByNr($_SESSION['list'], $nr);
            if ($page){
                $this->template->pagenr    = $nr;
                $this->template->page      = $page;
                $this->template->pagestotal= intval($this->page_m->getAmountOfPages($page->questionlist)->pages);               
                $m_questions = $this->questions_m->getQuestions($page->id);
                $types = $this->questions_m->getTypes();
                $questions = array();
                foreach ($m_questions as $item => $question){
                    $questions[] = array(
                        'nr' => $question->nr,
                        'id' => $question->id,
                        'type' => $this->getTypeStr($types, $question->type),
                        'question' => $question->question,
                        'answers' => $this->answers_m->getAnswers($question->id),
                    );
                }
                $this->template->questions = $questions;
                $this->template->render('lists/page');
            } else {
                if (isset($_SESSION['page'])){
                    $this->setCurrentFlashmessage($this->lang['pagenotfound'], 'danger');
                    $this->template->formdata = $formdata;
                    $this->template->render('lists/page/' . $_SESSION['page']);
                } else {
                    $this->setFlashmessage($this->lang['pagenotfound'], 'danger');
                    $this->redirect('home/index');
                }
            }
        } else {
            $this->redirect('home/index');
        }
    }

    public function index($nr=false)
    {
        if (isset($_SESSION['user']) and $nr != false) { //user info filled in
            $list = $this->lists_m->getList($nr);
            if ($list){
                $_SESSION['list'] = $nr;
                if (isset($_SESSION['currentpage'])){ //we have already done a page
                    $this->redirect('lists/page/' . $_SESSION['currentpage']);
                } else { //first page
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
