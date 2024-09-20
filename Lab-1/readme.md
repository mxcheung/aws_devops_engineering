

```
cd ~/environment/templates
aws cloudformation create-stack --stack-name Lab1 --parameters ParameterKey=InstanceType,ParameterValue=t2.micro --template-body file://lab1.yaml
```

```
{
    "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b"
}

```

```
aws cloudformation describe-stacks --stack-name Lab1
```


```
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
