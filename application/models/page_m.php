<?php

class Page_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'page';
    }
    
    public function addPage($list, $nr, $descr, $title) {
        $query = "INSERT INTO page (id, questionlist, nr, descr, title) VALUES ('', '$list', '$nr', '$descr', '$title');";
        $this->db->query($query);
    }
    
    public function deletePage($id) {
        $query = "DELETE FROM page WHERE (id = '$id')";
        $this->db->query($query);
    }

    public function getPages($listid)
    {
        $result = false;

        $query = "
            SELECT *
            FROM page
            WHERE (questionlist = '$listid')
            ORDER BY nr
        ";

        $pages = $this->db->query($query)->getResult();

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
            WHERE (questionlist = '$listid')
        ";

        $pages = $this->db->query($query)->getRow();

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
            WHERE (questionlist = '$listid') AND (nr = '$nr');
        ";

        $page = $this->db->query($query)->getRow();

        if ($page){
            $result = $page;
        }

        return $result; 
    }
	


}
