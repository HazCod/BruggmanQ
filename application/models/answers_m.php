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
	


}
