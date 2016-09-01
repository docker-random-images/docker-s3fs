[![](https://images.microbadger.com/badges/image/fabioluciano/docker-s3fs.svg)](https://microbadger.com/images/fabioluciano/docker-s3fs "Get your own image badge on microbadger.com")


## How to use

docker run -tid 
 --name s3-tunnel
 -e AWSACCESSKEYID=ACCESS_KEY 
 -e AWSSECRETACCESSKEY=SECRET_KEY
 --privileged --device /dev/fuse fabioluciano/s3fs
