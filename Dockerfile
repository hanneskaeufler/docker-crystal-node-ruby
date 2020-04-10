FROM crystallang/crystal:0.33.0

RUN apt-get update && apt-get install -y wget

RUN wget --quiet -O - https://deb.nodesource.com/setup_12.x | bash -

RUN wget --quiet -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/chrome.list

ENV DEBIAN_FRONTEND=noninteractive

RUN	apt-get -y update && apt-get install -y \
    binutils-dev \
    ca-certificates \
    cmake \
    fonts-liberation \
    gconf-service \
    git \
    google-chrome-stable \
    libappindicator1 \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libcurl4-openssl-dev \
    libdbus-1-3 \
    libdw-dev \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libiberty-dev \
    libnspr4 \
    libnss3 \
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
    lsb-release \
    nodejs \
    postgresql-client \
    tar \
    xdg-utils \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@6.13.4

RUN mkdir /tmp/kcov && cd /tmp/kcov && \
    git clone https://github.com/SimonKagstrom/kcov.git . && \
    git checkout v36 && \
    mkdir build && cd build && \
    cmake .. && make && make install
