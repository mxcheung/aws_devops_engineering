

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


```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ sam local start-api -p 8080
Initializing the lambda functions containers.                                                                                                                                                                                                        
Local image is up-to-date                                                                                                                                                                                                                            
Using local image: public.ecr.aws/lambda/python:3.9-rapid-x86_64.                                                                                                                                                                                    
                                                                                                                                                                                                                                                     
Mounting /home/ec2-user/environment/sam-app/.aws-sam/build/HelloWorldFunction as /var/task:ro,delegated, inside runtime container                                                                                                                    
Containers Initialization is done.                                                                                                                                                                                                                   
Mounting HelloWorldFunction at http://127.0.0.1:8080/hello [GET]                                                                                                                                                                                     
You can now browse to the above endpoints to invoke your functions. You do not need to restart/reload SAM CLI while working on your functions, changes will be reflected instantly/automatically. If you used sam build before running local         
commands, you will need to re-run sam build for the changes to be picked up. You only need to restart SAM CLI if you update your AWS SAM template                                                                                                    
2024-09-20 11:36:17 WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:8080
2024-09-20 11:36:17 Press CTRL+C to quit
```


# Task 1.3: Using AWS SAM to deploy an application

```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ sam package --output-template-file packaged.yaml --s3-bucket $labBucket
        Uploading to 3b92a1466a92b7cde4e33a3528108496  571511 / 571511  (100.00%)

Successfully packaged artifacts and wrote output template to file packaged.yaml.
Execute the following command to deploy the packaged template
sam deploy --template-file /home/ec2-user/environment/sam-app/packaged.yaml --stack-name <YOUR STACK NAME>
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ sam deploy --template-file packaged.yaml --stack-name sam-app --capabilities CAPABILITY_IAM
        Creating the required resources...
```


```
CloudFormation outputs from deployed stack
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Outputs                                                                                                                                                                                                                                          
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole                                                                                                                                                                                                    
Description         Implicit IAM Role created for Hello World function                                                                                                                                                                           
Value               arn:aws:iam::435019841659:role/sam-app-HelloWorldFunctionRole-a8r2MRwVPnqd                                                                                                                                                   

Key                 HelloWorldApi                                                                                                                                                                                                                
Description         API Gateway endpoint URL for Prod stage for Hello World function                                                                                                                                                             
Value               https://73b8hb83t4.execute-api.ap-south-1.amazonaws.com/Prod/hello/                                                                                                                                                          

Key                 HelloWorldFunction                                                                                                                                                                                                           
Description         Hello World Lambda Function ARN                                                                                                                                                                                              
Value               arn:aws:lambda:ap-south-1:435019841659:function:sam-app-HelloWorldFunction-Usbb1HNKi1cs                                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - sam-app in ap-south-1

AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $
```


```
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $ aws cloudformation describe-stacks --stack-name sam-app --query 'Stacks[].Outputs[?OutputKey==`HelloWorldApi`]' --output table
--------------------------------------------------------------------------------------------------------------------------------------------------------------
|                                                                       DescribeStacks                                                                       |
+-------------------------------------------------------------------+----------------+-----------------------------------------------------------------------+
|                            Description                            |   OutputKey    |                              OutputValue                              |
+-------------------------------------------------------------------+----------------+-----------------------------------------------------------------------+
|  API Gateway endpoint URL for Prod stage for Hello World function |  HelloWorldApi |  https://73b8hb83t4.execute-api.ap-south-1.amazonaws.com/Prod/hello/  |
+-------------------------------------------------------------------+----------------+-----------------------------------------------------------------------+
AWSLabsUser-dA5voJUXNvJzGSLfctPhxy:~/environment/sam-app $
```


# Task 2.2: Create the continuous delivery pipeline for your lab4 application

```
Deploy action provider
Deploy action provider
AWS CloudFormation
ActionMode
CHANGE_SET_REPLACE
StackName
sam-app
ChangeSetName
lab4-sam-changeset
TemplatePath
BuildArtifact::outputtemplate.yaml
Capabilities
CAPABILITY_IAM
RoleArn
arn:aws:iam::435019841659:role/SAM_Role
Configure automatic rollback on stage failure
Disabled
```
