FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && gem install rails
RUN mkdir /todo-server
WORKDIR /todo-server
COPY Gemfile /todo-server/Gemfile
COPY Gemfile.lock /todo-server/Gemfile
RUN bundle install
COPY . /todo-server

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

