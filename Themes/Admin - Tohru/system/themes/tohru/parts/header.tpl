<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{$pagetitle}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="{$config.url}holicon/style/fontawesome.min.css" rel="stylesheet">


    <style>
        /*!
        * Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com
        * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
        */

        @font-face {
            font-family: "Font Awesome 5 Free";
            font-style: normal;
            font-weight: 900;
            font-display: block;
            src: url({$config.url}holicon/fonts/fa-solid-900.eot);
            src: url({$config.url}holicon/fonts/fa-solid-900.eot?#iefix) format("embedded-opentype"),
            url({$config.url}holicon/fonts/fa-solid-900.woff2) format("woff2"),
            url({$config.url}holicon/fonts/fa-solid-900.woff) format("woff"),
            url({$config.url}holicon/fonts/fa-solid-900.ttf) format("truetype"),
            url({$config.url}holicon/fonts/fa-solid-900.svg#fontawesome) format("svg");
        }

        .fa,
        .fas {
            font-family: "Font Awesome 5 Free";
            font-weight: 900
        }

        /*!
        * Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com
        * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
        */
        @font-face {
            font-family: "Font Awesome 5 Brands";
            font-style: normal;
            font-weight: 400;
            font-display: block;
            src: url({$config.url}holicon/fonts/fa-brands-400.eot);
            src: url({$config.url}holicon/fonts/fa-brands-400.eot?#iefix) format("embedded-opentype"),
            url({$config.url}holicon/fonts/fa-brands-400.woff2) format("woff2"),
            url({$config.url}holicon/fonts/fa-brands-400.woff) format("woff"),
            url({$config.url}holicon/fonts/fa-brands-400.ttf) format("truetype"),
            url({$config.url}holicon/fonts/fa-brands-400.svg#fontawesome) format("svg");
        }

        .fab {
            font-family: "Font Awesome 5 Brands";
            font-weight: 400
        }

        main {
            display: flex;
            flex-wrap: nowrap;
            height: 100vh;
            height: -webkit-fill-available;
            max-height: 100vh;
            overflow-x: auto;
            overflow-y: hidden;
        }

        body {
            min-height: 100vh;
            min-height: -webkit-fill-available;
        }

        #pageContent {
            margin-top: 10px;
        }
    </style>

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="{$config.url}holicon/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="{$config.url}holicon/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="{$config.url}holicon/favicon/favicon-16x16.png">
    <link rel="manifest" href="{$config.url}holicon/favicon/site.webmanifest">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <div class="container-flex">
        <main>
            {if $error}
                <p>404 (temporary page)</p>
            {else}
                {include file="../parts/menu.tpl"}
{/if}