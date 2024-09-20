


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
