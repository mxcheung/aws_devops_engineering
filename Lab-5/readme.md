

# Task 1.2: Configure the web application image buildspec file


```
git add .
git commit -m "Updated buildspec file"
git push

 1 file changed, 1 insertion(+), 1 deletion(-)
AWSLabsUser-4QUmNYd6X5cY3aKBDYMnY9:~/environment/local_repo/my-webapp-repo (main) $ git push

```

# Task 3: Preparing the ECS cluster to support application deployment
In this task, you configure your ECS cluster to support the deployment of a demonstration application called my-webapp. You define an ECS task to refer to the application container image hosted in the ECR repo with necessary configuration details. Then, you define an ECS service to run containers based on the task definition behind a load balancer to support the traffic distribution once blue/green deployment goes live.

Task 3.1: Create Amazon ECS task definition

```
AWSLabsUser-4QUmNYd6X5cY3aKBDYMnY9:~/environment/local_repo/my-webapp-repo (main) $ cd ~/environment/local_repo/my-webapp-repo
AWSLabsUser-4QUmNYd6X5cY3aKBDYMnY9:~/environment/local_repo/my-webapp-repo (main) $ aws ecs register-task-definition --cli-input-json file://taskdef.json

{
    "taskDefinition": {
        "taskDefinitionArn": "arn:aws:ecs:eu-central-1:110016545771:task-definition/my-webapp:1",
        "containerDefinitions": [
            {
                "name": "my-webapp",
                "image": "110016545771.dkr.ecr.eu-central-1.amazonaws.com/my-webapp-repo",
                "cpu": 0,
                "portMappings": [
                    {
                        "containerPort": 80,
                        "hostPort": 80,
                        "protocol": "tcp"
                    }
                ],
                "essential": true,
                "environment": [],
```


```
AWSLabsUser-4QUmNYd6X5cY3aKBDYMnY9:~/environment/local_repo/my-webapp-repo (main) $ aws ecs create-service --service-name MyApp-Web-service --cli-input-json file://create-service.json
{
    "service": {
        "serviceArn": "arn:aws:ecs:eu-central-1:110016545771:service/my-webapp-cluster/MyApp-Web-service",
        "serviceName": "MyApp-Web-service",
        "clusterArn": "arn:aws:ecs:eu-central-1:110016545771:cluster/my-webapp-cluster",
        "loadBalancers": [
            {
                "targetGroupArn": "arn:aws:elasticloadbalancing:eu-central-1:110016545771:targetgroup/MyApp-ALB-target1/daebca60f31c7593",
                "containerName": "my-webapp",
                "containerPort": 80
            }
        ],
        "serviceRegistries": [],
        "status": "ACTIVE",
        "desiredCount": 1,
        "runningCount": 0,
        "pendingCount": 0,
        "launchType": "FARGATE",
        "platformVersion": "1.4.0",

```
