FROM node

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update && sudo apt-get install yarn



RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  build-essential \
  python \
  python3.6 \
  python-dev \
  python-pip \
  curl \
  git-core && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean

RUN pip install --upgrade --ignore-installed pip
RUN pip install virtualenv

RUN yarn global add serverless@1.19.0
