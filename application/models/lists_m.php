<?php

class Lists_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'lists';
    }
    
    public function movePageUp($pageid)
    {
        $query = "Update page
                  Set nr = nr+1
                  Where (nr != 0) AND (nr=(Select nr-1 From page where id='$pageid'));";
        $this->db->query($query);
    }

    public function movePageDown($pageid)
    {
        $query = "Update page
                  Set nr = nr-1
                  Where (nr != (SELECT count(*)-1 from page)) AND (nr=(Select nr+1 From page where id='$pageid'));";
        $this->db->query($query);
    }    
    
    
    public function addList($name) {
        $query = "INSERT INTO lists (id, name) VALUES ('', '$name');";  
        $this->db->query($query);
    }
    
    public function deleteList($id) {
        $query = "DELETE FROM lists WHERE (id = '$id')";
        $this->db->query($query);
    }
    
    public function addPage($name, $list, $descr, $nr)
    {
        $query = "INSERT INTO page (id, questionlist, nr, descr, title) VALUES ('', '$list', $nr, '$descr', '$name')";
        $this->db->query($query);
    }
    
    
    public function getPages( $list )
    {
        $result = false;
        $query = "SELECT * FROM page WHERE (questionlist = '$list') ORDER BY nr";
        
        $pages = $this->db->query($query)->getResult();

        if ($pages){
            $result = $pages;
        }

        return $result;
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
