<?php

class Lists_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'lists';
    }
    
    public function addList($name) {
        $query = "INSERT INTO lists (id, name) VALUES ('', '$name');";  
        $this->db->query($query);
    }
    
    public function deleteList($id) {
        $query = "DELETE FROM lists WHERE (id = '$id')";
        $this->db->query($query);
    }

    public function getLists()
    {
        $result = false;

        $query = "
            SELECT *
            FROM lists
            ORDER BY id
        ";

        $lists = $this->db->query($query)->getResult();

        if ($lists){
            $result = $lists;
        }

        return $result;
    }
    
    
    public function getLastUsers( $limit=false )
    {
        $result = false;
        if ($limit == false){
            $limit = 10;
        }
        $query = "
            SELECT date, firstname, lastname
            FROM users
            LIMIT $limit
        ";

        $users = $this->db->query($query)->getResult();

        if ($users){
            $result = $users;
        }

        return $result;
    }
	


}
