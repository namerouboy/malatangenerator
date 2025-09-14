FROM ruby:3.4

# 必要パッケージをまとめてインストール
RUN apt-get update -qq && apt-get install -y \
    curl gnupg2 build-essential libsqlite3-dev

# Node.js & Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]

