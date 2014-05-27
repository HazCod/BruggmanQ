<?php

class Answers_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'answers';
    }
    
    public function addAnswer($answer, $question, $nr, $code) {
        $query = "INSERT INTO answers (id, answer, nr, code) VALUES ('', ?, ?, ?);
                  INSERT INTO answerlists(question, answer) VALUES (?, LAST_INSERT_ID());";
        $this->db->query($query, array($answer, $nr, $code, $question));
    }
    
    public function deleteAnswer($id) {
        $query = "DELETE FROM answers WHERE (id = ?);";
        $this->db->query($query, $id);
        $query = "DELETE FROM answerlists WHERE (answer = ?);";
        $this->db->query($query, $id);
    }
    
    public function getAnswer($id) {
        $result = false;

        $query = "
            SELECT *
            FROM answers
            WHERE (id = ?);
        ";

        $answer = $this->db->query($query, $id)->getRow();

        if ($answer){
            $result = $answer;
        }

        return $result;
    }
    
    public function getAnswerlist($questionid)
    {
        $result = false;

        $query = "
            SELECT *
            FROM answerlists ql
            WHERE (ql.question = ?);
        ";

        $list = $this->db->query($query, $questionid)->getResult();

        if ($list){
            $result = $list;
        }

        return $result;
    }
    
    public function getQuestionsWithAnswers()
    {
        $result = false;

        $query = "
            SELECT question
            FROM answerlists
        ";

        $questions = $this->db->query($query)->getResult();

        if ($questions){
            $result = $questions;
        }

        return $result;
    }

    public function getAnswers($questionid)
    {
        $result = false;

        $query = "
            SELECT a.nr, a.id, a.answer
            FROM answerlists al
            INNER JOIN answers a ON (al.answer = a.id)
            WHERE (al.question = ?)
            ORDER BY nr
        ";

        $answers = $this->db->query($query, $questionid)->getResult();

        if ($answers){
            $result = $answers;
        }

        return $result;
    }
    
    
        public function moveAnswerUp($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT a.nr, a.id, al.question
                              FROM answers a
                              INNER JOIN answerlists al ON (a.id = al.answer) 
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT a.nr, a.id FROM answers a INNER JOIN answerlists al ON (a.id = al.answer) WHERE (question = $current->question) AND (nr = $current->nr - 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE answers SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE answers SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
        }
        return $result;
    }

    public function moveAnswerDown($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT a.nr, a.id, al.question
                              FROM answers a
                              INNER JOIN answerlists al ON (a.id = al.answer) 
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT a.nr, a.id FROM answers a INNER JOIN answerlists al ON (a.id = al.answer) WHERE (question = $current->question) AND (nr = $current->nr + 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE answers SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE answers SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
        }
        return $result;
    } 
	


}
