# 一键安装 (Windows PowerShell)：把本仓库的技能拷到 Claude Code 用户技能目录
# 用法： ./install.ps1
$ErrorActionPreference = 'Stop'

$src  = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $env:USERPROFILE '.claude\skills'
New-Item -ItemType Directory -Force -Path $dest | Out-Null

foreach ($s in 'coding','code-polish','memory') {
  $from = Join-Path $src $s
  if (Test-Path $from) {
    $to = Join-Path $dest $s
    if (Test-Path $to) { Remove-Item -Recurse -Force $to }
    Copy-Item -Recurse -Force $from $to
    Write-Host "[OK] installed: $s -> $to"
  } else {
    Write-Warning "[SKIP] not found: $from"
  }
}

Write-Host "Done. 重开 Claude Code 会话即可加载这些技能。"
