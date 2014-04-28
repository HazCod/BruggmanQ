<?php
// booting up
session_start();

define('APPLICATION_PATH', 'application/');
define('FRAMEWORK_PATH', 'system/');

// libraries and helpers
require_once(FRAMEWORK_PATH . 'Load.php');
require_once(FRAMEWORK_PATH . 'URL.php');
require_once(FRAMEWORK_PATH . 'DB.php');
require_once(FRAMEWORK_PATH . 'Controller.php');
require_once(FRAMEWORK_PATH . 'Template.php');
require_once(FRAMEWORK_PATH . 'Form.php');

// abstract classes
require_once(FRAMEWORK_PATH . 'Core_controller.php');
require_once(FRAMEWORK_PATH . 'Core_db.php');

// application config and abstract classes
require_once(APPLICATION_PATH . 'config.php');

$available_langs = array('nl', 'fr', 'en');
$default_lang = 'nl';
//- language
if (isset($_GET['lang'])){
    // check if the language is one we support
    if(in_array($_GET['lang'], $available_langs)){
        $_SESSION['lang'] = $_GET['lang']; // Set session
    } else {
        $_SESSION['lang'] = $default_lang;
    }
} elseif (!isset($_SESSION['lang'])) {
    $_SESSION['lang'] = $default_lang;
}

// initialising front controller
$controller = new Controller();

// run forest, run.
$controller->run();