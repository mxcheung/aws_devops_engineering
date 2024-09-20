$args = "/unattended" , "C:\HeartbeatService\HeartbeatService.exe"
Start-Process –FilePath C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\InstallUtil.exe –ArgumentList $args –NoNewWindow -Wait
Start-Service -Name AWSHeartbeatService -ErrorAction SilentlyContinue
