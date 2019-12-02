param(
    # overwrite upstream param
    [Alias("Repo")][String] $Upstream = "deide/deide-bucket:master",
    [Alias("App")][String[]] $Apps = ("*"),
    [Switch] $Request,
    [Switch] $Push
)

if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
if ($PullRequest.IsPresent -and $Push.IsPresent) {
    Write-Error "Must supply push (-p) or pull request (-r) switches, but not both at the same time";
    exit;
}
$autopr = "$env:SCOOP_HOME\\bin\\auto-pr.ps1"
$dir = "$psscriptroot\\..\\bucket" # checks the parent dir
& $autopr -Dir $dir -Upstream $Upstream -Request:$Request -Push:$Push -App ($Apps -Join " ")
