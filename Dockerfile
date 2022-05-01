FROM ruby:3.0.3

RUN curl https://deb.nodesource.com/setup_14.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


RUN apt-get update && apt-get install -y nodejs yarn
RUN yarn install --check-files 
RUN gem update && gem install rails && gem install bundler

ADD . /valhalla
WORKDIR /valhalla
RUN bundle install
EXPOSE 3000

CMD ["bash"]
