<div id="pageContent" class="container-fluid">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{$config.url}index.php">{$config.title}</a></li>
            <li class="breadcrumb-item"><a href="{$config.url}admin.php">Admin Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Users</li>
        </ol>
    </nav>

    <form method="get" name="search" accept="admin.php">
        <label for="inputUsername">Search for User</label>
        <div class="mb-3 row">
            <input type="text" readonly class="d-none" name="page" value="users">
            <div class="col-sm-6">
                <input type="text" name="query" class="form-control" id="inputUsername"
                    placeholder="Search for [username (string) (at least '{$config.db.search.min_length}' chars)!] or id:[id (integer)]"
                    value="{$query}">
            </div>
            <div class="col-sm-3 d-grid">
                <input type="submit" class="btn btn-block btn-primary" value="Search">
            </div>
            <div class="col-sm-3 d-grid">
                <a href="{$config.url}admin.php?page=users" class="btn btn-block btn-danger">
                    Reset
                </a>
            </div>
        </div>
    </form>

    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Avatar</th>
                <th scope="col">Username</th>
                <th scope="col">Level</th>
                <th scope="col">Location</th>
            </tr>
        </thead>
        <tbody>
            {if !empty($users)}
                {if $queryType == "username"}
                    {foreach from=$users item=item key=key name=name}
                        <tr>
                            <th scope="row">{$item.id}</th>
                            <td>
                                <a href="{$item.avatar}" target="_blank">
                                    <img src="{$item.avatar}" style="height: 25px">
                                </a>
                            </td>
                            <td>

                                {$item.username}
                                (<a
                                    href="{$config.url}admin.php?page=manage&type=user&id={$item.id}&callback={encodeString($currentFullUrl, $config.salt)}">Manage</a>)
                                (<a href="{$config.url}index.php?page=profile&id={$item.id}" target="_blank">View Public
                                    profile</a>)
                            </td>
                            <td>{$item.level}</td>
                            <td>{$item.location}</td>
                        </tr>
                    {/foreach}
                {elseif $queryType == "id"}
                    {if !empty($users.id)}
                        <tr>
                            <th scope="row">{$users.id}</th>
                            <td>
                                <a href="{$users.avatar}" target="_blank">
                                    <img src="{$users.avatar}" style="height: 25px">
                                </a>
                            </td>
                            <td>

                                {$users.username}
                                (<a
                                    href="{$config.url}admin.php?page=manage&type=user&id={$users.id}&callback=page_users&query={$query}">Manage</a>)
                                (<a href="{$config.url}index.php?page=profile&id={$users.id}" target="_blank">View Public
                                    profile</a>)
                            </td>
                            <td>{$users.level}</td>
                            <td>{$users.location}</td>
                        </tr>
                    {/if}
                {/if}
            {else}
                <tr>
                    <td></td>
                    <td></td>
                    <th>
                        No user found.
                    </th>
                    <td></td>
                    <td></td>
                </tr>
            {/if}
        </tbody>
    </table>

    {if !empty($users) && $queryType == "username"}
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item {if $pagination == 1}disabled{/if}">
                    <a class="page-link" href="?pagination=1">First</a>
                </li>
                <li class="page-item {if $pagination <= 1}disabled{/if}">
                    <a class="page-link" href="?pagination={$pagination - 1}">Prev</a>
                </li>

                {foreach from=$pagis item=item key=key name=name}
                    {if $pagination != $item}
                        <li class="page-item"><a class="page-link" href="?pagination={$item}">{$item}</a></li>
                    {else}
                        <li class="page-item active"><a class="page-link" href="?pagination={$item}">{$item}</a></li>
                    {/if}
                {/foreach}

                <li class="page-item {if $pagination >= $totalpages}disabled{/if}">
                    <a class="page-link" href="?pagination={$pagination + 1}">Next</a>
                </li>
                <li class="page-item {if $pagination >= $totalpages}disabled{/if}">
                    <a class="page-link" href="?pagination={$totalpages}">Last</a>
                </li>
            </ul>
        </nav>
    {/if}

</div>