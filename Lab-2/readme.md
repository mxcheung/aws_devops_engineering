

# Task 1.2: Review if CodeDeploy Agent is running

In this task, you verify if the CodeDeploy agent is installed and running on the HeartBeat-Instances.

What is AWS CodeDeploy agent?

The CodeDeploy agent is a software package that, when installed and configured on an instance, makes it possible for that instance to be used in CodeDeploy deployments.

Return to the EC2 Management Console browser window.

In the navigation pane, choose Instances.

Select one of the instances named Heartbeat-Instance.


```
PS C:\Windows\system32> powershell.exe -Command Get-Service -Name codedeployagent

Status   Name               DisplayName
------   ----               -----------
Running  codedeployagent    CodeDeploy Host Agent Service
```
