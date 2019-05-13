.PHONY: deps clean build package deploy

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

package:
	sam package --output-template-file packaged.yml --s3-bucket waldek.bira.artifacts --profile wb

deploy:
	sam deploy --template-file packaged.yml --stack-name hello-sam --capabilities CAPABILITY_IAM --profile wb