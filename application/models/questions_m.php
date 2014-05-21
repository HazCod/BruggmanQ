<?php

class Questions_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'questions';
    }
    
    public function addQuestion($question, $type, $nr, $extra, $page) {
        $query = "INSERT INTO questions (id, question, type, nr, extra) VALUES ('', ?, ?, ?, ?);
                  INSERT INTO questionlists(page, question) VALUES (?, LAST_INSERT_ID());";
        $this->db->query($query, array($question, $type, $nr, $extra, $page));
    }
   
    /**
        $query = "INSERT INTO questionlists (page, question) VALUES ('$page', '$question')";
        $this->db->query($query);
    }
     */
    
    public function deleteQuestion($id) {
        $query = "DELETE FROM questions WHERE (id = ?)";
        $this->db->query($query, $id);
        $query = "DELETE FROM questionlists WHERE (question = ?)";
        $this->db->query($query, $id);
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
	


}
