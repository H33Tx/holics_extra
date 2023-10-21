<?php

$pages = [];
if (str_contains($currentFullUrl, "index.php")) {
    $thisPage["name"] = "home";
    $thisPage["tpl"] = "index";
    $thisPage["title"] = $config["slogan"];
    $thisPage["datasheet"] = ps("sheets/ids_default");

    $pages = $indexPages;
    $pgArr = "index";
} elseif (str_contains($currentFullUrl, "admin.php")) {
    $thisPage["name"] = "home";
    $thisPage["tpl"] = "index";
    $thisPage["title"] = $config["slogan"];
    $thisPage["datasheet"] = ps("sheets/ads_default");

    $pages = $adminPages;
    $pgArr = "admin";
}

if (!empty($pages)) {
    $found = false;
    // if (isset($_GET["page"]) && !empty($_GET["page"])) {
    if (isset($_GET["page"]))
        $thisPage["name"] = $_GET["page"];

    foreach ($pages as $key => $page) {
        if ($page["name"] == $thisPage["name"]) {
            $thisPage = $pages[$key];
            $found = true;
            break;
        }
    }
    // }
    if (!$found)
        $error = true;

    if (!file_exists(ps(__DIR__ . "/../_data/{$thisPage["datasheet"]}.php")))
        die("Plugin thisPage found datasheet '{$thisPage["datasheet"]}.php' but it cannot be found in _data! Please create/download/add it.");
    require ps(__DIR__ . "/../_data/{$thisPage["datasheet"]}.php");

    $smarty->assign("currentPage", $thisPage["name"]);
    $smarty->assign("pagetitle", titlify($thisPage["title"], $config["divider"], $config["title"]));
    $smarty->assign("error", $error);

    $tplPage = $thisPage["tpl"];
}
