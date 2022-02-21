FROM ruby:3.0.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN apt-get update -qq && apt-get install -y nodejs 
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

RUN bundle install 

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"] 
