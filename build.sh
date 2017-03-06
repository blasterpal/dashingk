# docker build -t #{Zoe.config.registry}/#{ENV['APP']}:#{ENV['TAG']} #{build_dir}
TAG=$1
REPO=primerevenue-docker.jfrog.io

docker build -t $REPO/dashingk:$TAG . 
docker push $REPO/dashingk:$TAG
