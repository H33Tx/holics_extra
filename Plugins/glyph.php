<?php

// Adds the glyph() function and returns Bootstrap 3.x Glyph.

function glyph($glyph, $title = "") {
    echo "<span class=\"glyphicon glyphicon-$glyph\" title=\"$title\"></span>";
}
