<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; min-height: 100vh">
    <a href="{$config.url}admin.php"
        class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4">
            <i class="fas fa-toolbox fa-fw" aria-hidden="true"></i>
            Admin Panel
        </span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="{$config.url}admin.php?page=home"
                class="nav-link {if $menuTab == "index"}active{else}text-white{/if}" aria-current="page">
                <i class="fa fa-home fa-fw" aria-hidden="true"></i>
                Index
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=statistics"
                class="nav-link {if $menuTab == "statistics"}active{else}text-white{/if}">
                <i class="fas fa-chart-line fa-fw" aria-hidden="true"></i>
                Statistics
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=users"
                class="nav-link {if $menuTab == "users"}active{else}text-white{/if}">
                <i class="fas fa-users fa-fw" aria-hidden="true"></i>
                Users
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=animes"
                class="nav-link {if $menuTab == "animes"}active{else}text-white{/if}">
                <i class="fas fa-film fa-fw" aria-hidden="true"></i>
                Animes
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=reports"
                class="nav-link {if $menuTab == "reports"}active{else}text-white{/if}">
                <i class="fas fa-flag fa-fw" aria-hidden="true"></i>
                Reports
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=comments"
                class="nav-link {if $menuTab == "comments"}active{else}text-white{/if}">
                <i class="fas fa-envelope fa-fw" aria-hidden="true"></i>
                Comments
            </a>
        </li>
        <li>
            <a href="{$config.url}admin.php?page=logs"
                class="nav-link {if $menuTab == "logs"}active{else}text-white{/if}">
                <i class="fas fa-file fa-fw" aria-hidden="true"></i>
                Logs
            </a>
        </li>
    </ul>
    <hr>
    <div class="dropdown">
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1"
            data-bs-toggle="dropdown" aria-expanded="false">
            <img src="{$user.avatar}" alt="" width="32" height="32" class="rounded-circle me-2">
            <strong>{$user.username}</strong>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="{$config.url}">Return to Home</a></li>
        </ul>
    </div>
</div>