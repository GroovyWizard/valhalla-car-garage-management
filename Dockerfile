FROM ruby:2.7.0-alpine

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

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY package.json yarn.lock /myapp/

RUN gem install bundler
RUN gem install rails
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
RUN yarn install --check-files

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"] 
