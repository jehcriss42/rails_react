FROM ruby:2.6.6

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN apt-get update -qq && apt-get install -y nodejs npm ; npm i -g npm@next \
    $$ npm install -g webpack ; npm install -g yarn \
    && yarn install \
    && bundle install ; bundle exec rails webpacker:compile ; bundle exec rake db:drop db:create db:migrate
# uncomment the code bellow to RUN the test in the container
# RUN bundle exec rake spec  

EXPOSE 3000
# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]