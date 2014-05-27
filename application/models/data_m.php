<?php

class Data_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'data';
    }
    
    public function addData($user, $question, $answerid, $customanswer) {
        $query = "INSERT INTO data (userid, questionid, answerid, answer) VALUES ('$user', '$question', '$answerid', '$customanswer');";
        $this->db->query($query, array($user, $question, $answerid, $customanswer));
    }
    
    public function deleteUserData($id) {
        $query = "DELETE FROM data WHERE (userid = ?);"
                . "DELETE FROM users WHERE (id = ?);";
        $this->db->query($query, array($id, $id));
    } 
    
    public function getUserByName($fullname){
        $result = false;
        $query = "SELECT * FROM users WHERE (firstname = ?) AND (lastname = ?);";
        $ename = explode('_', $fullname);
        $usr = $this->db->query($query, array($ename[0], $ename[1]))->getRow();
        if ($usr){
            $result = $usr;
        }
        return $result;
        
    }
    
    public function addUser($firstname, $lastname) {
        $query = "INSERT INTO users (id, firstname, lastname, date) VALUES ('', ?, ?, NOW())";
        $this->db->query($query, array($firstname, $lastname));
    }
    
    public function getUserData($userid)
    {
        $result = false;

        $query = "
            SELECT *
            FROM data
            WHERE (userid = ?)
            ORDER BY userid
        ";

        $answers = $this->db->query($query, $userid)->getResult();

        if ($answers){
            $result = $answers;
        }

        return $result;
    }
    
    public function getAllData()
    {
        $result = false;

        $query = "
            SELECT u.date, u.firstname, u.lastname, u.id
            FROM data d
                INNER JOIN users u ON (d.userid = u.id)
            GROUP BY u.date, u.firstname, u.lastname
            ORDER BY userid
        ";

        $answers = $this->db->query($query)->getResult();

        if ($answers){
            $result = $answers;
        }

        return $result;
    }
    
    public function getUserAnswers($userid)
    {
        $result = false;
        $query = "SELECT 
                    qq.nr as nr,
                    (SELECT question FROM questions q WHERE (q.id = d.questionid)) AS question,
                    CASE 
                        WHEN (d.answerid = 0) THEN d.answer 
                        ELSE (SELECT answer FROM answers a WHERE (a.id = d.answerid)) 
                    END AS answer,
                    (SELECT flag FROM langs la INNER JOIN lists li ON (li.language = la.id) INNER JOIN page p ON (p.questionlist = li.id) INNER JOIN questionlists ql ON (ql.page = p.id) WHERE (ql.question = qq.id)) AS lang
                  FROM data d JOIN questions qq ON (qq.id = d.questionid)
                  WHERE (d.userid = '?')
                  ORDER BY qq.nr";
        $answers = $this->db->query($query, $userid)->getResult();
        if ($answers){
            $result = $answers;
        } 
        return $result;
    }
	


}
