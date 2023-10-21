<?php

if (!file_exists(ps(__DIR__ . "/../_data/pages.php")))
    die("Theme requires pages List 'pages.php' but it does not exist! Please create/download/add it.");
require ps(__DIR__ . "/../_data/pages.php");
