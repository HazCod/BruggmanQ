<?php

class Answers_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'answers';
    }
    
    public function addAnswer($answer, $question, $nr, $code) {
        $query = "INSERT INTO answers (id, answer, nr, code) VALUES ('', '$answer', '$nr', '$code');
                  INSERT INTO answerlists(question, answer) VALUES ('$question', LAST_INSERT_ID());";
        $this->db->query($query);
    }
    
    public function deleteAnswer($id) {
        $query = "DELETE FROM answers WHERE (id = '$id');";
        $this->db->query($query);
        $query = "DELETE FROM answerlists WHERE (answer = '$id');";
        $this->db->query($query);
    }
    
    public function getAnswer($id) {
        $result = false;

        $query = "
            SELECT *
            FROM answers
            WHERE (id = '$id');
        ";

        $answer = $this->db->query($query)->getRow();

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
            WHERE (ql.question = '$questionid');
        ";

        $list = $this->db->query($query)->getResult();

        if ($list){
            $result = $list;
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
            WHERE (al.question = '$questionid')
            ORDER BY nr
        ";

        $answers = $this->db->query($query)->getResult();

        if ($answers){
            $result = $answers;
        }

        return $result;
    }
	


}
