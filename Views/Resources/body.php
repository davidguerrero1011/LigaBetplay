<?php

    if (isset($_GET["code"])) {
        if ($_GET["code"] == 1) {
            require_once("../layouts/clubs.php");
        } elseif ($_GET["code"] == 2) {
            require_once("../layouts/championships.php");
        } elseif ($_GET["code"] == 3) {
            require_once("../layouts/schedules.php");
        } elseif ($_GET["code"] == 4) {
            require_once("../layouts/stadistics.php");
        }
    } else {
        require_once("./Views/layouts/home.php");
    }