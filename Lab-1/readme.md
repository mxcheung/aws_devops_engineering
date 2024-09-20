

```
cd ~/environment/templates
aws cloudformation create-stack --stack-name Lab1 --parameters ParameterKey=InstanceType,ParameterValue=t2.micro --template-body file://lab1.yaml
```

