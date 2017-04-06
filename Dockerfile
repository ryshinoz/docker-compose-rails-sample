FROM ruby:2.4

ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential && apt-get install -y nodejs

ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

ARG APP_HOME
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME


RUN bundle config build.nokogiri --use-system-libraries

ENTRYPOINT [ \
  "prehook", "ruby -v", "--", \
  "prehook", "bundle install -j3 --quiet", "--"]
