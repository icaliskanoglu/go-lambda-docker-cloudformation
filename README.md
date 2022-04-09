# Sample Lambda Function with Dokcer and Cloudformation Template

## Build
```
docker buildx build --platform linux/arm64 -t <docker-image-uri> --push .
```

## Deploy
```bash
aws cloudformation deploy --template-file template.yml CAPABILITY_NAMED_IAM --parameter-overrides ImageUri=<docker-image> FunctionName=<function-name> --stack-name <stack-name>
```

## Run Localy
### Prepare Local
```
mkdir -p ~/.aws-lambda-rie && curl -Lo ~/.aws-lambda-rie/aws-lambda-rie \
https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie \
&& chmod +x ~/.aws-lambda-rie/aws-lambda-rie
```
### Run docker compose
```
docker-compose up
```

### Invoke
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```