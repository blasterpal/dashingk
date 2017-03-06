# About 

The docker-compose file runs a Dashing server with two directories mounted from this directory: `jobs` and `dashboards`. These directories can be edited and customized to be loaded into Dashing.
# Prerequisites

Text written `like this is a command`


## Software 

1. Docker 
2. Docker Compose
3. git

Docker must be running and running locally and on default TCP port OR 
the `DOCKER_HOST` environment variable must be correct.

# Get code to run or develop

`git clone git://github.com/blasterpal/dashingk`

# To Develop Code locally

Via Command line:

1. Install Ruby 2+.

2. Install bundler, http://bundler.io/

3. change to directory of code. i.e. `cd dashing`

4. type `bundle`


# To build and start Docker container(s) 

`docker-compose up -d`

Now visit your server/workstation's IP with port `8080`:

`http://<server ip>:8080`

# Docker Customizations

* Put custom jobs in 'jobs' directory
* Put custom dashboards in 'dashboards' directory
* Edit configs s in 'config' directory

# To restart Docker containers

`docker-compose restart`

# To stop containers

`docker-compose stop`

# Run Docker container for deployment

docker run -p 8080:3030  primerevenue-docker.jfrog.io/dashingk:0.1.0 
