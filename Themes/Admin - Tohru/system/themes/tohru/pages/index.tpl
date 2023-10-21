<div id="pageContent" class="container-fluid">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{$config.url}index.php">{$config.title}</a></li>
            <li class="breadcrumb-item"><a href="{$config.url}admin.php">Admin Panel</a></li>
            <li class="breadcrumb-item active" aria-current="page">Index</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col" onclick="window.location='{$config.url}admin.php?page=users';">
            <div class="alert alert-primary text-center fs-5" role="alert">
                Current Users
                <span class="badge text-bg-secondary">{$currentUsers}</span>
            </div>
        </div>
        <div class="col" onclick="window.location='{$config.url}admin.php?page=comments';">
            <div class="alert alert-success text-center fs-5" role="alert">
                New Blacklisted Comments
                <span class="badge text-bg-secondary">{$blacklistedComments}</span>
            </div>
        </div>
        <div class="col" onclick="window.location='{$config.url}admin.php?page=reports';">
            <div class="alert alert-danger text-center fs-5" role="alert">
                Unsolved Reports
                <span class="badge text-bg-secondary">{$unsolvedReports}</span>
            </div>
        </div>
    </div>

    <div>
        What else should be here?
    </div>

</div>

<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: "line",
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September",
                "October", "November", "December"
            ],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>