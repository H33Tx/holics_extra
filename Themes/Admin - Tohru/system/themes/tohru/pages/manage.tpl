<div id="pageContent" class="container-fluid">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{$config.url}index.php">{$config.title}</a></li>
            <li class="breadcrumb-item"><a href="{$config.url}admin.php">Admin Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Manage</li>
        </ol>
    </nav>

    {if $callback}
        <div class="mb-3 row">
            <div class="col-sm-12 d-grid">
                <a href="{$callbackUrl}" class="btn btn-block btn-primary">Return</a>
            </div>
        </div>
    {/if}

    

    {if $callback}
        <div class="mb-3 row">
            <div class="col-sm-12 d-grid">
                <a href="{$callbackUrl}" class="btn btn-block btn-primary">Return</a>
            </div>
        </div>
    {/if}

</div>