

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


# Developer Tools > CodeDeploy > Applications >  HeartBeatProduction-App > HeartBeatProduction-App-Group

```
Deployment group details
Deployment group name
HeartBeatProduction-App-Group
Application name
HeartBeatProduction-App
Compute platform
EC2/On-premises
Deployment type
In-place
Service role ARN
arn:aws:iam::106956192965:role/CodeDeployServiceRole
Deployment configuration
CodeDeployDefault.AllAtOnce
Rollback enabled
False
Agent update scheduler
Learn to schedule update in AWS Systems Manager 
```

# Task 4.1: Push the application to archive file

```
AWSLabsUser-hW2iayvZSrYrvso9XFzMi:~/environment $ bucketName=heartbeat-codedeploy-artifacts-mc-2035
AWSLabsUser-hW2iayvZSrYrvso9XFzMi:~/environment $ aws s3 mb s3://$bucketName
make_bucket: heartbeat-codedeploy-artifacts-mc-2035
AWSLabsUser-hW2iayvZSrYrvso9XFzMi:~/environment $
AWSLabsUser-hW2iayvZSrYrvso9XFzMi:~/environment $ cd ~/environment/CodeDeployHeartbeatDemo
aws deploy create-deployment --application-name HeartBeatProduction-App --deployment-group-name HeartBeatProduction-App-Group --deployment-config-name CodeDeployDefault.AllAtOnce --description "Initial Deployment" --s3-location bucket=$bucketName,key=HeartBeat-App.zip,bundleType=zip
{                                                 cd ~/env
    "deploymentId": "d-PWE8KPZ67"
}

```



# Task 4.4: Review the deployment targets

```

PS C:\Windows\system32> Service "AWSHeartbeat*"

Status   Name               DisplayName
------   ----               -----------
Running  AWSHeartbeatSer... AWS Heartbeat Demo Service


PS C:\Windows\system32> Content C:\Logs\HeartBeatService.log -last 10
[INFO]09/20 10:18:37 - Heartbeat - Deploy has Worked on Tuesday! Iteration 131
[INFO]09/20 10:18:38 - Heartbeat - Deploy has Worked on Tuesday! Iteration 132
[INFO]09/20 10:18:39 - Heartbeat - Deploy has Worked on Tuesday! Iteration 133
[INFO]09/20 10:18:40 - Heartbeat - Deploy has Worked on Tuesday! Iteration 134
[INFO]09/20 10:18:41 - Heartbeat - Deploy has Worked on Tuesday! Iteration 135
[INFO]09/20 10:18:42 - Heartbeat - Deploy has Worked on Tuesday! Iteration 136
[INFO]09/20 10:18:43 - Heartbeat - Deploy has Worked on Tuesday! Iteration 137
[INFO]09/20 10:18:44 - Heartbeat - Deploy has Worked on Tuesday! Iteration 138
[INFO]09/20 10:18:45 - Heartbeat - Deploy has Worked on Tuesday! Iteration 139
[INFO]09/20 10:18:46 - Heartbeat - Deploy has Worked on Tuesday! Iteration 140
```
