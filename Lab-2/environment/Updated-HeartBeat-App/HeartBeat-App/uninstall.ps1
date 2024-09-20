$service = Get-Service -Name AWSHeartbeatService -ErrorAction SilentlyContinue

if ($service.Length -gt 0) 
{
    Stop-Service -Name AWSHeartbeatService -ErrorAction SilentlyContinue
    $serviceHandle = Get-WmiObject -Class Win32_Service -Filter "Name='AWSHeartbeatService'"
    $serviceHandle.delete()    
}

