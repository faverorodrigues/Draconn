# Coleta de informações
$info = @()
$info += "Modelo do Computador: $((Get-WmiObject Win32_ComputerSystem).Model)"
$info += "Nome do Computador: $env:COMPUTERNAME"
$info += "Usuário Atual: $env:USERNAME"
$info += "Sistema Operacional: $((Get-WmiObject Win32_OperatingSystem).Caption)"
$info += "Arquitetura: $((Get-WmiObject Win32_OperatingSystem).OSArchitecture)"
$info += "Processador: $((Get-WmiObject Win32_Processor).Name)"
$info += "Memória RAM (GB): {0:N2}" -f (($((Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory) / 1GB))
$info += "Endereço IP: $((Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4' -and $_.InterfaceAlias -notlike 'Loopback*'} | Select-Object -First 1 -ExpandProperty IPAddress))"

# Caminho do arquivo
$caminho = "$env:USERPROFILE\Desktop\info_pc.txt"
$info | Out-File -FilePath $caminho -Encoding Default

Write-Host "Arquivo gerado em: $caminho"
