FROM crystallang/crystal:0.24.1

# install build dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install -y nodejs yarn

RUN apt-get install -y ruby-full
RUN gem install bundler

RUN apt-get install -y wget git tar
RUN apt-get install -y libreadline6
