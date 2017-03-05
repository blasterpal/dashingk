FROM frvi/dashing

COPY ./jobs /jobs/
COPY ./dashboards /dashboards
COPY ./widgets /widgets

CMD 'bundle exec dash start'

