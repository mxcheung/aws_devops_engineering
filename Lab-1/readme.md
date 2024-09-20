

```
cd ~/environment/templates
aws cloudformation create-stack --stack-name Lab1 --parameters ParameterKey=InstanceType,ParameterValue=t2.micro --template-body file://lab1.yaml
```

```
{
    "StackId": "arn:aws:cloudformation:ap-northeast-1:100593996707:stack/Lab1/5429cd30-771c-11ef-afa9-066a6fa0217b"
}

```
