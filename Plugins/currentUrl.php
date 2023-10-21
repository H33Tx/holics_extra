<?php

$currentUrl = $_SERVER["REQUEST_URI"];
$currentFullUrl = $actual_link = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$currentUrl = str_replace("amp;", "", $currentUrl);
$currentFullUrl = str_replace("amp;", "", $currentFullUrl);
$smarty->assign("currentUrl", $currentUrl);
$smarty->assign("currentFullUrl", $currentFullUrl);
