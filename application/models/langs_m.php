<?php
class Langs_m extends Core_db
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'langs';
    }
    
    public function addLang($name, $flag) {
        $query = "INSERT INTO langs (id, name, flag) VALUES ('', '$name', '$flag');";  
        $this->db->query($query);
    }
    
    public function deleteLang($id) {
        $query = "DELETE FROM langs WHERE (id = '$id');";
        $this->db->query($query);
    } 
    
    public function getLangs()
    {
        $result = false;
        $query =   "SELECT * FROM langs";  
        
        $langs = $this->db->query($query)->getResult();

        if ($langs){
            $result = $langs;
        }

        return $result;
    }
    
}
