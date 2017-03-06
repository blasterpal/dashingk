FROM frvi/dashing

MAINTAINER Hank Beaver <hbeaver@primerevenue.com>

## http://blog.carbonfiv2e.com/2015/03/17/docker-rails-docker-compose-together-in-your-development-workflow
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /dashing
WORKDIR /dashing

CMD bash -l -c 'bundle exec dashing start'

