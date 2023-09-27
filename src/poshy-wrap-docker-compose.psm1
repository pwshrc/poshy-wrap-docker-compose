#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command docker-compose) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

Set-Alias -Name dco -Value docker-compose
Export-ModuleMember -Alias dco

function Invoke-DockerComposeBuild {
    docker-compose build @args
}
Set-Alias -Name dcb -Value Invoke-DockerComposeBuild
Export-ModuleMember -Function Invoke-DockerComposeBuild -Alias dcb

function Invoke-DockerComposeExec {
    docker-compose exec @args
}
Set-Alias -Name dce -Value Invoke-DockerComposeExec
Export-ModuleMember -Function Invoke-DockerComposeExec -Alias dce

function Invoke-DockerComposePs {
    docker-compose ps @args
}
Set-Alias -Name dcps -Value Invoke-DockerComposePs
Export-ModuleMember -Function Invoke-DockerComposePs -Alias dcps

function Invoke-DockerComposeRestart {
    docker-compose restart @args
}
Set-Alias -Name dcrestart -Value Invoke-DockerComposeRestart
Export-ModuleMember -Function Invoke-DockerComposeRestart -Alias dcrestart

function Invoke-DockerComposeRm {
    docker-compose rm @args
}
Set-Alias -Name dcrm -Value Invoke-DockerComposeRm
Export-ModuleMember -Function Invoke-DockerComposeRm -Alias dcrm

function Invoke-DockerComposeRun {
    docker-compose run @args
}
Set-Alias -Name dcr -Value Invoke-DockerComposeRun
Export-ModuleMember -Function Invoke-DockerComposeRun -Alias dcr

function Invoke-DockerComposeStop {
    docker-compose stop @args
}
Set-Alias -Name dcstop -Value Invoke-DockerComposeStop
Export-ModuleMember -Function Invoke-DockerComposeStop -Alias dcstop

function Invoke-DockerComposeUp {
    docker-compose up @args
}
Set-Alias -Name dcup -Value Invoke-DockerComposeUp
Export-ModuleMember -Function Invoke-DockerComposeUp -Alias dcup

function Invoke-DockerComposeUpWithBuild {
    docker-compose up --build @args
}
Set-Alias -Name dcupb -Value Invoke-DockerComposeUpWithBuild
Export-ModuleMember -Function Invoke-DockerComposeUpWithBuild -Alias dcupb

function Invoke-DockerComposeUpDetached {
    docker-compose up -d @args
}
Set-Alias -Name dcupd -Value Invoke-DockerComposeUpDetached
Export-ModuleMember -Function Invoke-DockerComposeUpDetached -Alias dcupd

function Invoke-DockerComposeUpDetachedWithBuild {
    docker-compose up -d --build @args
}
Set-Alias -Name dcupbd -Value Invoke-DockerComposeUpDetachedWithBuild
Export-ModuleMember -Function Invoke-DockerComposeUpDetachedWithBuild -Alias dcupbd

function Invoke-DockerComposeDown {
    docker-compose down @args
}
Set-Alias -Name dcdn -Value Invoke-DockerComposeDown
Export-ModuleMember -Function Invoke-DockerComposeDown -Alias dcdn

function Invoke-DockerComposeLogs {
    docker-compose logs @args
}
Set-Alias -Name dcl -Value Invoke-DockerComposeLogs
Export-ModuleMember -Function Invoke-DockerComposeLogs -Alias dcl

function Invoke-DockerComposeLogsFollow {
    docker-compose logs -f @args
}
Set-Alias -Name dclf -Value Invoke-DockerComposeLogsFollow
Export-ModuleMember -Function Invoke-DockerComposeLogsFollow -Alias dclf

function Invoke-DockerComposePull {
    docker-compose pull @args
}
Set-Alias -Name dcpull -Value Invoke-DockerComposePull
Export-ModuleMember -Function Invoke-DockerComposePull -Alias dcpull

function Invoke-DockerComposeStart {
    docker-compose start @args
}
Set-Alias -Name dcstart -Value Invoke-DockerComposeStart
Export-ModuleMember -Function Invoke-DockerComposeStart -Alias dcstart

function Invoke-DockerComposeKill {
    docker-compose kill @args
}
Set-Alias -Name dck -Value Invoke-DockerComposeKill
Export-ModuleMember -Function Invoke-DockerComposeKill -Alias dck

<#
.SYNOPSIS
    Shut down, remove and start again the docker-compose setup, then tail the logs.
#>
function docker-compose-fresh() {
    param(
        [Parameter(Mandatory = $false, Position = 0)]
        [string] $dockerComposeYamlFile = $null
    )
    [string[]] $fileArgs = @()
    if ($dockerComposeYamlFile) {
        $fileArgs = @("--file", $dockerComposeYamlFile)
    }
    docker-compose @fileArgs stop
    docker-compose @fileArgs rm -f
    docker-compose @fileArgs up -d
    docker-compose @fileArgs logs -f --tail 100
}
Set-Alias -Name dcofresh -Value docker-compose-fresh
Export-ModuleMember -Function docker-compose-fresh -Alias dcofresh

function Invoke-DockerComposeLogsFollowTail {
    docker-compose logs -f --tail 100 @args
}
Set-Alias -Name dcol -Value Invoke-DockerComposeLogsFollowTail
Export-ModuleMember -Function Invoke-DockerComposeLogsFollowTail -Alias dcol

function Invoke-DockerComposeUp {
    docker-compose up @args
}
Set-Alias -Name dcou -Value Invoke-DockerComposeUp
Export-ModuleMember -Function Invoke-DockerComposeUp -Alias dcou

function Invoke-DockerComposeUpNoStart {
    Invoke-DockerComposeUp --no-start @args
}
Set-Alias -Name dcouns -Value Invoke-DockerComposeUpNoStart
Export-ModuleMember -Function Invoke-DockerComposeUpNoStart -Alias dcouns
