<?php

class Page_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'page';
    }
    
    public function addPage($list, $nr, $descr, $title) {
        $query = "INSERT INTO page (id, questionlist, nr, descr, title) VALUES ('', ?, ?, ?, ?);";
        $this->db->query($query, array($list, $nr, $descr, $title));
    }
    
    public function deletePage($id) {
        $query = "DELETE FROM page WHERE (id = ?)";
        $this->db->query($query, $id);
    }

    public function getPages($listid)
    {
        $result = false;

        $query = "
            SELECT *
            FROM page
            WHERE (questionlist = ?)
            ORDER BY nr
        ";

        $pages = $this->db->query($query, $listid)->getResult();

        if ($pages){
            $result = $pages;
        }

        return $result;
    }
    
    public function getAmountOfPages($listid)
    {
        $result = false;

        $query = "
            SELECT count(id) AS pages
            FROM page
            WHERE (questionlist = ?)
        ";

        $pages = $this->db->query($query, $listid)->getRow();

        if ($pages){
            $result = $pages;
        }

        return $result;
    }
    
    public function getPageByNr($listid, $nr)
    {
        $result = false;

        $query = "
            SELECT *
            FROM page
            WHERE (questionlist = ?) AND (nr = ?);
        ";

        $page = $this->db->query($query, array($listid, $nr))->getRow();

        if ($page){
            $result = $page;
        }

        return $result; 
    }
	


}
