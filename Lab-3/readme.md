


# Task 2: Preparing the application code for deployment

```
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment $ TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    56  100    56    0     0  28211      0 --:--:-- --:--:-- --:--:-- 56000
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment $ curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/region
ap-southeast-1AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment $ 

myRegion=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/region)

```

```
wget https://$myRegion-tcprod.s3.amazonaws.com/courses/ILT-TF-200-DEVOPS/v3.6.8.prod-659f76dc/lab-3-CodePipeline/bundles/CodeDeployHeartbeatDemo.zip -P CodeDeployHeartbeatDemo

```



```
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment $ cd ~/environment/CodeDeployHeartbeatDemo
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $ aws s3api list-buckets --output text --query 'Buckets[?contains(Name,`applicationsourcebucket`)].Name'
labstack-23d03e98-8142-4c9-applicationsourcebucket-yesbxzxk6cjo
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $ myAppSrcBucket=$(aws s3api list-buckets --output text --query 'Buckets[?contains(Name,`applicationsourcebucket`)].Name')
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $ aws s3 cp ~/environment/CodeDeployHeartbeatDemo/CodeDeployHeartbeatDemo.zip s3://$myAppSrcBucket/HeartBeat-App.zip
upload: ./CodeDeployHeartbeatDemo.zip to s3://labstack-23d03e98-8142-4c9-applicationsourcebucket-yesbxzxk6cjo/HeartBeat-App.zip
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $
```


# Task 3: Creating an AWS CodePipeline


```
Step 1: Choose pipeline settings
Pipeline settings
Pipeline name
CodePipeline
Pipeline type
V2
Execution mode
QUEUED
Artifact location
A new Amazon S3 bucket will be created as the default artifact store for your pipeline
Service role name
AWSCodePipelineServiceRole-ap-southeast-1-CodePipeline
```


# Task 4 Verifying the CodePipeline deployment

```
PS C:\Windows\system32> Service "AWSHeartbeat*"

Status   Name               DisplayName
------   ----               -----------
Running  AWSHeartbeatSer... AWS Heartbeat Demo Service


PS C:\Windows\system32> Content C:\Logs\HeartBeatService.log -last 10
[INFO]09/20 10:58:18 - Heartbeat - Deploy has Worked on Tuesday! Iteration 77
[INFO]09/20 10:58:19 - Heartbeat - Deploy has Worked on Tuesday! Iteration 78
[INFO]09/20 10:58:20 - Heartbeat - Deploy has Worked on Tuesday! Iteration 79
[INFO]09/20 10:58:21 - Heartbeat - Deploy has Worked on Tuesday! Iteration 80
[INFO]0
```



# Task 5: Change the HeartBeatProduction-App source code
Task 5.1 Retrieve the updated application and upload it to the Amazon S3 application source bucket

```
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $ aws s3 cp s3://$myRegion-tcprod/courses/ILT-TF-200-DEVOPS/v3.6.8.prod-659f76dc/lab-3-CodePipeline/bundles/updated-HeartBeat-App.zip s3://$myAppSrcBucket/HeartBeat-App.zipcopy: s3://ap-southeast-1-tcprod/courses/ILT-TF-200-DEVOPS/v3.6.8.prod-659f76dc/lab-3-CodePipeline/bundles/updated-HeartBeat-App.zip to s3://labstack-23d03e98-8142-4c9-applicationsourcebucket-yesbxzxk6cjo/HeartBeat-App.zip
AWSLabsUser-ftpihyArqEEUECgH2heCWu:~/environment/CodeDeployHeartbeatDemo $
```
