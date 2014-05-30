<?php

class Questions_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'questions';
        $this->answers_m = Load::model('answers_m');
    }
    
    public function addQuestion($question, $type, $nr, $extra, $code, $page) {
        $query = "INSERT INTO questions (id, question, type, nr, extra, code) VALUES ('', ?, ?, ?, ?, ?);
                  INSERT INTO questionlists(page, question) VALUES (?, LAST_INSERT_ID());";
        $this->db->query($query, array($question, $type, $nr, $extra, $code, $page));
    }
    
    public function deleteQuestion($id) {
        $query = "DELETE FROM questions WHERE (id = ?)";
        $this->db->query($query, $id);
        $query = "DELETE FROM questionlists WHERE (question = ?)";
        $this->db->query($query, $id);
        $answers = $this->answers_m->getAnswers($id);
        if ($answers){
            foreach ($answers as $answer){
                $this->answers_m->deleteAnswer($answer->id);
                $this->db->query("DELETE FROM answerlists WHERE (answer = $answer->id);");
            }
        }
    }
    
    public function getQuestion($id) {
        $result = false;

        $query = "
            SELECT *
            FROM questions
            WHERE (id = ?);
        ";

        $question = $this->db->query($query, $id)->getRow();

        if ($question){
            $result = $question;
        }

        return $result;
    }
    
    public function getTypes() {
        $result = false;

        $query = "
            SELECT *
            FROM types
        ";

        $types = $this->db->query($query)->getResult();

        if ($types){
            $result = $types;
        }

        return $result;
    }
    
    public function getQuestionlist($pageid)
    {
        $result = false;

        $query = "
            SELECT *
            FROM questionlists ql
            WHERE (ql.page = ?)
        ";

        $list = $this->db->query($query, $pageid)->getResult();

        if ($list){
            $result = $list;
        }

        return $result;
    }

    public function getQuestions($pageid)
    {
        $result = false;

        $query = "
            SELECT page, q.nr, q.id, q.question, q.type, q.extra
            FROM questionlists ql
            INNER JOIN questions q ON (ql.question = q.id)
            WHERE (ql.page = ?)
            ORDER BY nr
        ";

        $questions = $this->db->query($query, $pageid)->getResult();

        if ($questions){
            $result = $questions;
        }

        return $result;
    }
    
    
    
        public function moveQuestionUp($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT nr, id, ql.page
                              FROM  questions
                              INNER JOIN questionlists ql ON (id = ql.question)
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT nr, id FROM questions INNER JOIN questionlists ql ON (id = ql.question) WHERE (ql.page = $current->page) AND (nr = $current->nr - 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE questions SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE questions SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
        }
        return $result;
    }

    public function moveQuestionDown($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT nr, id, ql.page
                              FROM  questions
                              INNER JOIN questionlists ql ON (id = ql.question)
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT nr, id FROM questions INNER JOIN questionlists ql ON (id = ql.question) WHERE (ql.page = $current->page) AND (nr = $current->nr + 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE questions SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE questions SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
        }
        return $result;
    } 
	


}
