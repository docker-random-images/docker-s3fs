docker run -tid 
 --name s3-tunnel
 -e AWSACCESSKEYID=ACCESS_KEY 
 -e AWSSECRETACCESSKEY=SECRET_KEY
 --privileged --device /dev/fuse fabioluciano/s3
