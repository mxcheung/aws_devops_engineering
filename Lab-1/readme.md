

# Task 2: Create an AWS CloudFormation template

```
cd ~/environment/templates
aws cloudformation create-stack --stack-name Lab1 --parameters ParameterKey=InstanceType,ParameterValue=t2.micro --template-body file://lab1.yaml

{
    "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b"
}

```

```
aws cloudformation describe-stacks --stack-name Lab1

{
    "Stacks": [
        {
            "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b",
            "StackName": "Lab1",
            "Description": "AWS CloudFormation Simple Infrastructure Template VPC_Single_Instance_In_Subnet: This template will show how to create a VPC and add an EC2 instance with an Elastic IP address and a security group.",
            "Parameters": [
                {
                    "ParameterKey": "InstanceType",
                    "ParameterValue": "t2.micro"
                },
                {
                    "ParameterKey": "VPCCIDR",
                    "ParameterValue": "10.199.0.0/16"
                },
                {
                    "ParameterKey": "PUBSUBNET1",
                    "ParameterValue": "10.199.10.0/24"
                },
                {
```



```
AWSLabsUser-sBi3fUneoasJVdkWxs1FGJ:~/environment/templates (main) $ aws cloudformation describe-stack-resource-drifts --stack-name Lab1 --stack-resource-drift-status-filters MODIFIED DELETED
{
    "StackResourceDrifts": []
}
```

# Task 5: Update the stack using a change set

## Task 5.1: Modify the Security Group Rules
```
{
    "StackResourceDrifts": [
        {
            "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b",
            "LogicalResourceId": "InstanceSecurityGroup",
            "PhysicalResourceId": "sg-02a3a7f6ad2f94608",
            "ResourceType": "AWS::EC2::SecurityGroup",
            "ExpectedProperties": "{\"GroupDescription\":\"Enable HTTP via port 80\",\"SecurityGroupIngress\":[{\"CidrIp\":\"1.1.1.1/32\",\"FromPort\":80,\"IpProtocol\":\"tcp\",\"ToPort\":80}],\"VpcId\":\"vpc-0c80f2c9f367876c4\"}",
            "ActualProperties": "{\"GroupDescription\":\"Enable HTTP via port 80\",\"SecurityGroupIngress\":[{\"CidrIp\":\"0.0.0.0/0\",\"FromPort\":80,\"IpProtocol\":\"tcp\",\"ToPort\":80}],\"VpcId\":\"vpc-0c80f2c9f367876c4\"}",
            "PropertyDifferences": [
                {
                    "PropertyPath": "/SecurityGroupIngress/0/CidrIp",
                    "ExpectedValue": "1.1.1.1/32",
                    "ActualValue": "0.0.0.0/0",
                    "DifferenceType": "NOT_EQUAL"
                }
            ],
            "StackResourceDriftStatus": "MODIFIED",
            "Timestamp": "2024-09-20T06:58:17.757000+00:00"
        }
    ]

```

## Task 5.2: Create the change set
```
AWSLabsUser-sBi3fUneoasJVdkWxs1FGJ:~/environment/templates (main) $ aws cloudformation create-change-set --stack-name Lab1 --change-set-name Lab1ChangeSet --parameters ParameterKey=InstanceType,ParameterValue=t2.micro --template-body file://lab1-CS.yaml
{
    "Id": "arn:aws:cloudformation:ap-northeast-1:100593996707:changeSet/Lab1ChangeSet/21bb33be-fb5f-458d-a2fc-f7f449757369",
    "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b"
}
```

# Task 5.5: Verify the AppURL is working
In this task, you access the AppURL link to ensure the security group change made is successfully implemented.

Return to the Your Environments browser tab, return to the Lab1 stack console view.

On the Outputs tab, launch the URL shown in a new browser tab.

When loaded, a webpage is displayed with the following message: “Congratulations, you have successfully deployed a simple infrastructure using AWS CloudFormation”.

```
http://52.193.104.162/
Congratulations, you have successfully deployed a simple infrastructure using AWS CloudFormation.
```
