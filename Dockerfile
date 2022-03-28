FROM ruby:3.0.3

RUN apt-get update -qq \
&& apt-get install -y nodejs 
RUN gem update && gem install rails && gem install bundler

ADD . /valhalla
WORKDIR /valhalla
RUN bundle install
EXPOSE 3000

CMD ["bash"]
