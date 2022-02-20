FROM ruby:3.1.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN apt-get update -qq && apt-get install -y nodejs 
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN bundle install 

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn 
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
RUN yarn install --check-files
CMD ["rails", "server", "-b", "0.0.0.0"] 
