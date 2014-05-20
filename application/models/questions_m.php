<?php

class Questions_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'questions';
    }
    
    public function addQuestion($question, $type, $nr, $page) {
        $query = "INSERT INTO questions (id, question, type, nr) VALUES ('', '$question', '$type', '$nr');
                  INSERT INTO questionlists(page, question) VALUES ('$page', LAST_INSERT_ID());";
        $this->db->query($query);
    }
   
    /**
        $query = "INSERT INTO questionlists (page, question) VALUES ('$page', '$question')";
        $this->db->query($query);
    }
     */
    
    public function deleteQuestion($id) {
        $query = "DELETE FROM questions WHERE (id = '$id')";
        $this->db->query($query);
        $query = "DELETE FROM questionlists WHERE (question = '$id')";
        $this->db->query($query);
    }
    
    public function getQuestion($id) {
        $result = false;

        $query = "
            SELECT *
            FROM questions
            WHERE (id = '$id');
        ";

        $question = $this->db->query($query)->getRow();

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
            WHERE (ql.page = '$pageid')
        ";

        $list = $this->db->query($query)->getResult();

        if ($list){
            $result = $list;
        }

        return $result;
    }

    public function getQuestions($pageid)
    {
        $result = false;

        $query = "
            SELECT page, q.nr, q.id, q.question, q.type
            FROM questionlists ql
            INNER JOIN questions q ON (ql.question = q.id)
            WHERE (ql.page = '$pageid')
            ORDER BY nr
        ";

        $questions = $this->db->query($query)->getResult();

        if ($questions){
            $result = $questions;
        }

        return $result;
    }
	


}
