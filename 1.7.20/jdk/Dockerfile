FROM java:8-jdk
MAINTAINER Dlani Leonardo <dlanileonardo@gmail.com>

LABEL org.label-schema.vcs-url="https://github.com/dlanileonardo/docker-jruby" \
      org.label-schema.vendor=dlanileonardo \
      org.label-schema.name=docker-jruby \
      io.wikiwi.license=MIT

ENV JRUBY_VERSION 1.7.20
RUN mkdir /opt/jruby \
  && curl -sSL https://s3.amazonaws.com/jruby.org/downloads/${JRUBY_VERSION}/jruby-bin-${JRUBY_VERSION}.tar.gz \
  | tar -zxC /opt/jruby --strip-components=1 \
  && update-alternatives --install /usr/local/bin/ruby ruby /opt/jruby/bin/jruby 1
ENV PATH /opt/jruby/bin:$PATH

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler \
	&& bundle config --global path "$GEM_HOME" \
	&& bundle config --global bin "$GEM_HOME/bin"

RUN apt-get update
RUN apt-get -y install git

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

CMD [ "irb" ]
