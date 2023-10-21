<?php

$loop_view = "list";
if (isset($_COOKIE["loop-view"])) {
    $loop_view = clean($_COOKIE["loop-view"]);
}
$smarty->assign("loop_view", $loop_view);
