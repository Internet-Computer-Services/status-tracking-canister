FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y vim wait-for-it curl

RUN apt-get install -y libunwind-dev
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /.nvm

ENV NODE_VERSION=16.17.0
ENV NVM_DIR=/.nvm
RUN curl --fail -sSf https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN node --version
RUN npm --version

RUN node --version && \
    npm --version

RUN DFX_VERSION=0.12.1 sh -ci "$(curl -sSL https://internetcomputer.org/install.sh)"
RUN dfx cache install

WORKDIR /app

COPY src /app/src
COPY dfx.json /app
COPY ./script.sh /app
COPY ./start-and-wait.sh /app
RUN chmod +x script.sh
RUN chmod +x ./start-and-wait.sh
CMD ["./start-and-wait.sh"]
