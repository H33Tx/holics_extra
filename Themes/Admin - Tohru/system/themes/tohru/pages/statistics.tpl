<div id="pageContent" class="container-fluid">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{$config.url}index.php">{$config.title}</a></li>
            <li class="breadcrumb-item"><a href="{$config.url}admin.php">Admin Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Statistics</li>
        </ol>
    </nav>

    <div class="border border-2 rounded p-2">
        <p class="fs-3">Account-Statistics</p>
        <div class="row">
            <div class="col">
                <div class="border border-2 rounded">
                    <canvas id="signupChart"></canvas>
                </div>
            </div>
            <div class="col">
                <div class="border border-2 rounded">
                    <canvas id="loginChart" class="col"></canvas>
                </div>
            </div>
            <div class="col">
                <div class="border border-2 rounded">
                    <canvas id="logoutChart" class="col"></canvas>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    const signupCtx = document.getElementById("signupChart");
    new Chart(signupCtx, {
        type: "bar",
        data: {
            labels: [
                {foreach from=$stats.signups item=year key=ykey name=yname}
                    {foreach from=$stats.signups.$ykey item=month key=mkey name=mname}
                        "{$ykey}-{$mkey}",
                    {/foreach}
                {/foreach}
            ],
            datasets: [{
                label: "# of actions",
                data: [
                    {foreach from=$stats.signups item=year key=ykey name=yname}
                        {foreach from=$stats.signups.$ykey item=month key=mkey name=mname}

                            {foreach from=$stats.signups item=signup key=lkey name=lname}
                                {$count = []}
                                {foreach from=$stats.signups.$lkey item=item2 key=key2 name=name2}
                                    {foreach from=$stats.signups.$lkey.$key2 item=item3 key=key3 name=name3}
                                        {if $item3.year == $ykey && $item3.month == $mkey}
                                            {$count[] = 0}
                                        {/if}
                                    {/foreach}
                                {/foreach}
                                {count($count)},
                            {/foreach}

                        {/foreach}
                    {/foreach}
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Signups'
                }
            }
        }
    });

    const loginCtx = document.getElementById("loginChart");
    new Chart(loginCtx, {
        type: "bar",
        data: {
            labels: [
                {foreach from=$stats.logins item=year key=ykey name=yname}
                    {foreach from=$stats.logins.$ykey item=month key=mkey name=mname}
                        "{$ykey}-{$mkey}",
                    {/foreach}
                {/foreach}
            ],
            datasets: [{
                label: "# of actions",
                data: [
                    {foreach from=$stats.logins item=year key=ykey name=yname}
                        {foreach from=$stats.logins.$ykey item=month key=mkey name=mname}

                            {foreach from=$stats.logins item=login key=lkey name=lname}
                                {$count = []}
                                {foreach from=$stats.logins.$lkey item=item2 key=key2 name=name2}
                                    {foreach from=$stats.logins.$lkey.$key2 item=item3 key=key3 name=name3}
                                        {if $item3.year == $ykey && $item3.month == $mkey}
                                            {$count[] = 0}
                                        {/if}
                                    {/foreach}
                                {/foreach}
                                {count($count)},
                            {/foreach}

                        {/foreach}
                    {/foreach}
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Logins'
                }
            }
        }
    });

    const logoutCtx = document.getElementById("logoutChart");
    new Chart(logoutCtx, {
        type: "bar",
        data: {
            labels: [
                {foreach from=$stats.logouts item=year key=ykey name=yname}
                    {foreach from=$stats.logouts.$ykey item=month key=mkey name=mname}
                        "{$ykey}-{$mkey}",
                    {/foreach}
                {/foreach}
            ],
            datasets: [{
                label: "# of actions",
                data: [
                    {foreach from=$stats.logouts item=year key=ykey name=yname}
                        {foreach from=$stats.logouts.$ykey item=month key=mkey name=mname}

                            {foreach from=$stats.logouts item=logout key=lkey name=lname}
                                {$count = []}
                                {foreach from=$stats.logouts.$lkey item=item2 key=key2 name=name2}
                                    {foreach from=$stats.logouts.$lkey.$key2 item=item3 key=key3 name=name3}
                                        {if $item3.year == $ykey && $item3.month == $mkey}
                                            {$count[] = 0}
                                        {/if}
                                    {/foreach}
                                {/foreach}
                                {count($count)},
                            {/foreach}

                        {/foreach}
                    {/foreach}
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Logouts'
                }
            }
        }
    });
</script>