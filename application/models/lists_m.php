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
        $queryGetUpperPage = "SELECT nr-1
                              FROM pages
                              WHERE (id = ?)";
        $nrUpper = $this->db->query($queryGetUpperPage, $pageid)->getRow()->nr;
        if ($nrUpper != false){
            // Move the upper page down
            $query2 = "UPDATE page SET nr = ('$nrUpper' - 1) WHERE (nr = '$nrUpper');";
            $this->db->query($query2);
            // Move this row up
            $query1 = "UDPATE page SET nr = '$nrUpper' WHERE (id = '$pageid')";
            $this->db->query($query1);
            return true;
        } else {
            return false;
        }
    }

    public function movePageDown($pageid)
    {
        $querygetLowerPage = "SELECT nr+1
                              FROM pages
                              WHERE (id = ?)";
        $nrLower = $this->db->query($querygetLowerPage, $pageid)->getRow()->nr;
        if ($nrLower != false){
            // Move the lower page up
            $query2 = "UPDATE page SET nr = ('$nrLower' + 1) WHERE (nr = '$nrLower');";
            $this->db->query($query2);
            // Move this row down
            $query1 = "UDPATE page SET nr = '$nrLower' WHERE (id = '$pageid')";
            $this->db->query($query1);
            return true;
        } else {
            return false;
        }
    }    
    
    
    public function addList($name, $language) {
        $query = "INSERT INTO lists (id, name, language) VALUES ('', ?, ?);";  
        $this->db->query($query, array($name, $language));
    }
    
    public function deleteList($id) {
        $query = "DELETE FROM lists WHERE (id = ?);";
        $this->db->query($query, $id);
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
    
    public function getList( $nr )
    {
        $result = false;
        $query = "SELECT * FROM lists WHERE (id = ?);";
        $list = $this->db->query($query, $nr)->getRow();
        if ($list){
            $result = $list;
        }
        return $result;
    }
    
    public function getListsbyLang( $lang )
    {
        $result = false;

        $query = "
            SELECT li.id, li.name
            FROM lists li INNER JOIN langs la ON (li.language = la.id)
            WHERE (la.flag = ?);
        ";

        $lists = $this->db->query($query, $lang)->getResult();

        if ($lists){
            $result = $lists;
        }

        return $result;
    }
    
    
    public function getLastUsers( )
    {
        $result = false;
        $query = "
            SELECT u.date, u.firstname, u.lastname, count(distinct page) as done
            FROM users u
                 LEFT OUTER JOIN data d ON (d.userid = u.id)
                 LEFT OUTER JOIN questionlists ql ON (ql.question = d.questionid)
            LIMIT 10
        ";

        $users = $this->db->query($query)->getResult();

        if ($users){
            $result = $users;
        }

        return $result;
    }
	


}
