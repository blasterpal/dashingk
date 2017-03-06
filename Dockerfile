FROM frvi/dashing

MAINTAINER Hank Beaver <hbeaver@primerevenue.com>

ADD . /dashing

# This docker file is not wholly meant for Prod. It is firstly designed for SOA Development of all apps
# Must use root for local OSX dev for now. will replace with NFS/SMB later?
#
ENV APP_HOME /dashing
WORKDIR $APP_HOME


## http://blog.carbonfiv2e.com/2015/03/17/docker-rails-docker-compose-together-in-your-development-workflow
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR $APP_HOME

CMD 'bundle exec dash start'

