<?php

    require_once("./credentials.php");

    class Connection {

        protected $connected;
        protected $host;
        protected $user;
        protected $password;
        protected $name;
        protected $charset;
        protected $port;

        public function __construct() {
            $this->host = DB_HOST;
            $this->user = DB_USER;
            $this->password = DB_PASSWORD;
            $this->name = DB_NAME;
            $this->charset = DB_CHARSET;
            $this->port = DB_PORT;
        }

        public function connect() {
            
            $connection = "mysql:host=$this->host;port=$this->port;dbname=$this->name";
            $options = array(
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES $this->charset",
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
            );
            try {
                return $this->connected = new PDO($connection, $this->user, $this->password, $options);
            } catch (PDOException $e) {
                echo $e->getMessage();
                die;
            }
            
        }
    }