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
        $query = "DELETE FROM data WHERE (userid = ?);";
        $this->db->query($query, $id);
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
            SELECT *
            FROM data
            ORDER BY userid
        ";

        $answers = $this->db->query($query)->getResult();

        if ($answers){
            $result = $answers;
        }

        return $result;
    }
	


}
