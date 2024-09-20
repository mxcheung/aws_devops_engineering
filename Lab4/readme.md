

# Task 1: Introduction to AWS SAM elements

Task 1.2: Building an application with AWS SAM

```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment $ sam init --runtime python3.9

        SAM CLI now collects telemetry to better understand customer needs.

        You can OPT OUT and disable telemetry collection by setting the
        environment variable SAM_CLI_TELEMETRY=0 in your shell.
        Thanks for your help!

        Learn More: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html

```


```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment $ cd ./sam-app
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ sam build
Starting Build use cache                                                                                                                                                                                                                             
Manifest file is changed (new hash: 3298f13049d19cffaa37ca931dd4d421) or dependency folder (.aws-sam/deps/b5ae0d7e-d22b-4afc-b18e-8078666428aa) is missing for (HelloWorldFunction), downloading dependencies and copying/building source            
Building codeuri: /home/ec2-user/environment/sam-app/hello_world runtime: python3.9 metadata: {} architecture: x86_64 functions: HelloWorldFunction                                                                                                  
 Running PythonPipBuilder:CleanUp                                                                                                                                                                                                                    
 Running PythonPipBuilder:ResolveDependencies                                                                                                                                                                                                        
 Running PythonPipBuilder:CopySource                                                                                                                                                                                                                 
 Running PythonPipBuilder:CopySource                                                                                                                                                                                                                 


```


```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ sam local invoke HelloWorldFunction --event events/event.json
Invoking app.lambda_handler (python3.9)                                                                                                                                                                                                              
Local image was not found.                                                                                                                                                                                                                           
Removing rapid images for repo public.ecr.aws/sam/emulation-python3.9                                                                                                                                                                                
Building image...........................................................................................................................................................................
Using local image: public.ecr.aws/lambda/python:3.9-rapid-x86_64.                                                                                                                                                                                    
                                                                                                                                                                                                                                                     
Mounting /home/ec2-user/environment/sam-app/.aws-sam/build/HelloWorldFunction as /var/task:ro,delegated, inside runtime container                                                                                                                    
START RequestId: c88b9dea-5297-4b8a-b5ae-313a938ce3d7 Version: $LATEST
END RequestId: a7cf3ba9-a2a4-41b9-a982-d0cee29c95c7
REPORT RequestId: a7cf3ba9-a2a4-41b9-a982-d0cee29c95c7  Init Duration: 0.07 ms  Duration: 51.57 ms      Billed Duration: 52 ms  Memory Size: 128 MB     Max Memory Used: 128 MB
{"statusCode": 200, "body": "{\"message\": \"hello world\"}"}
```
