<?php

class Dbh {
    private $hostname = "localhost";
    private $username = "root";
    private $password = "";
    private $database = "food-project";

    public function connect() {
        $conn = new mysqli($this->hostname, $this->username, $this->password, $this->database);
        if ($conn->connect_error) {
            die("Connection Failed: " . $conn->connect_error);
        }
        return $conn;
    }
}