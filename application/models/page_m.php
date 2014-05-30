<?php

class Page_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'page';
        $this->questions_m = Load::model('questions_m');
    }
    
    public function addPage($list, $nr, $descr, $title) {
        $query = "INSERT INTO page (id, questionlist, nr, descr, title) VALUES ('', ?, ?, ?, ?);";
        $this->db->query($query, array($list, $nr, $descr, $title));
    }
    
    public function deletePage($id) {
        $query = "DELETE FROM page WHERE (id = ?)";
        $this->db->query($query, $id);
        $questions = $this->questions_m->getQuestions($id);
        if ($questions){
            foreach ($questions as $question){
                $this->questions_m->deleteQuestion($question->id);
                $this->db->query("DELETE FROM questionlists WHERE (question = $question->id);");
            }
        }
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
    
    
    public function movePageUp($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT nr, id, questionlist
                              FROM page
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT nr, id FROM page WHERE (questionlist = $current->questionlist) AND (nr = $current->nr - 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE page SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE page SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
        }
        return $result;
    }

    public function movePageDown($pageid)
    {
        $result = false;
        $queryGetUpperPage = "SELECT nr, id, questionlist
                              FROM page
                              WHERE (id = ?);";
        $current = $this->db->query($queryGetUpperPage, $pageid)->getRow();
        if ($current != false){
            $q_other = "SELECT nr, id FROM page WHERE (questionlist = $current->questionlist) AND (nr = $current->nr + 1)";
            $other= $this->db->query($q_other)->getRow();
            if ($other){
                $query = "UPDATE page SET nr = $current->nr WHERE (id = $other->id);
                          UPDATE page SET nr = $other->nr WHERE (id = $current->id);";
                $this->db->query($query);
                $result = true;
            }
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
