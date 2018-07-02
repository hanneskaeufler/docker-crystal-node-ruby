FROM crystallang/crystal:0.25.1

# install build dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install -y nodejs yarn

RUN apt-get install -y ruby-full
RUN gem install bundler

RUN apt-get install -y wget git tar

RUN	apt-get -y update
RUN apt-get install -y \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget

RUN wget https://dl-ssl.google.com/linux/linux_signing_key.pub && apt-key add linux_signing_key.pub && \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/chrome.list

RUN	apt-get -y update && \
	apt-get -y install google-chrome-stable

RUN apt-get install -y postgresql-client

RUN npm install -g backstopjs --unsafe-perm
