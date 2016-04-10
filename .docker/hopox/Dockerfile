FROM afsmnghr/rails-pg:2.2.0

EXPOSE 3000
CMD rm -rf tmp log && (bundle check \
    || bundle install --path vendor/bundle --jobs 20 --retry 5) \
    && rake db:migrate && mkdir -p tmp/pids \
    && bundle exec bin/delayed_job start \
    && bundle exec rails s -b 0.0.0.0
