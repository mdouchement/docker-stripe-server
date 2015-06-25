FROM ruby:2.2.0
MAINTAINER mdouchement

# Set the locale
ENV LANG c.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo 'gem: --no-document' >> ~/.gemrc
RUN gem install thin
RUN gem install stripe-ruby-mock

# App/User settings
RUN useradd trololo -u 1000 -s /bin/bash --no-create-home

USER trololo
ENV HOME /

EXPOSE 4999
CMD ["stripe-mock-server", "--debug"]
