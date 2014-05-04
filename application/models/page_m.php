<?php

class Page_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'page';
    }
    
    public function addPage($name, $nr, $descr, $title) {
        $query = "INSERT INTO page (id, questionlist, nr, descr, title) VALUES ('', '$name', '$nr', '$descr', '$title');";  
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
            $result = $lists;
        }

        return $result;
    }
	


}
