function getHistoryMatchChinese() { Get-History | Where-Object {[int[]][char[]]$_.CommandLine.ToString() -ge 255} }
function he { help $args[0] -Examples; if ($args[0] -match "-") { Get-Alias -Definition $args[0] } }
function stGvim () { Start-Process E:\UserSoft\amixVim\vim80\gvim.exe -WindowStyle Maximized }
