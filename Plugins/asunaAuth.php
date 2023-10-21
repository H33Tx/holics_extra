<?php

if (!file_exists(ps(__DIR__ . "/../_data/asuna_token.txt"))) die("AsunaAuth plugin activated but no Token provided.");
$asunaKey = file_get_contents(ps(__DIR__ . "/../_data/asuna_token.txt"));
if (empty($asunaKey)) die("Provided Token for AsunaAuth empty.");
if (strlen($asunaKey) !== 36) die("Provided Token for AsunaAuth too short/long.");

$db["asAu_tokens"] = new \SleekDB\Store("asAu_tokens", ps(__DIR__ . "/../../database"), $config["db"]);

if (!file_exists(ps(__DIR__ . "/../_data/asunaSalt.txt"))) {
    $salt = file_get_contents("https://auth.asuna.cloud/api.php?k={$asunaKey}&a=getPublicSalt");
    $saltFile = fopen(ps(__DIR__ . "/../_data/asunaSalt.txt"), "w");
    fwrite($saltFile, $salt);
    fclose($saltFile);
}

$asunaSalt = file_get_contents(ps(__DIR__ . "/../_data/asunaSalt.txt"));

if (!$logged) {
    $tmpToken = genToken();
    $data = array(
        "token" => $tmpToken,
        "timestamp" => now()
    );
    $db["asAu_tokens"]->insert($data);
    $string = "index.php?page=account&sc={$tmpToken}&st=rplc&decoded";
    $to = encodeString($string, $asunaSalt);
    $smarty->assign("loginTo", $to);
    // die($to);
}

if (str_contains($currentFullUrl, "sc") && str_contains($currentFullUrl, "account") && !isset($_GET["sc"])) {
    header("Location: $currentFullUrl");
    die("flol");
}

if (isset($_GET["sc"]) && !empty($_GET["sc"])) {
    $sc = clean($_GET["sc"]);
    $dbTs = $db["asAu_tokens"]->findOneBy(["token", "==", $sc]);
    if (!empty($dbTs)) {
        if (strtotime($dbTs["timestamp"]) > strtotime("-5 minutes")) {
            $db["asAu_tokens"]->deleteBy(["token", "==", $sc]);

            $st = clean($_GET["st"]);
            setcookie("asuna_session", $st, time() + 1000 * 60 * 60 * 24 * 365, "/", $_SERVER["SERVER_NAME"]);
            addStat("login");
        } else {
            die("Timestamp too old. Try again!");
        }
    }
}

if (isset($_COOKIE["asuna_session"]) && !empty($_COOKIE["asuna_session"])) {
    $asunaSession = clean($_COOKIE["asuna_session"]);
    $call = jd(file_get_contents("https://auth.asuna.cloud/api.php?k={$asunaKey}&a=isSessionValid&st={$asunaSession}"));
    // die(print_r($call));
    if (!empty($call) && $call["success"]) {
        $logged = true;
        $dbCall = $db["users"]->findOneBy([["uid", "==", $call["uid"]], "AND", ["location", "==", "external"]]);
        if (empty($dbCall)) {
            $aUser = jd(file_get_contents("https://auth.asuna.cloud/api.php?k={$asunaKey}&a=accountInfo&uid={$call["uid"]}"));
            // die(print_r($aUser));
            $data = [
                "uid" => $call["uid"],
                "username" => $aUser["userData"]["username"],
                "avatar" => $aUser["userData"]["avatar"],
                "location" => "external",
                "level" => $config["default"]["level"],
                "asunaTimestamp" => $aUser["userData"]["timestamp"],
                "timestamp" => now()
            ];
            $db["users"]->insert($data);
            addStat("signup");
            header("Refresh: 0");
        } else {
            $user = $dbCall;
            // $smarty->assign("user", $dbCall);
            // die(print_r($dbCall));
        }
    }
}
