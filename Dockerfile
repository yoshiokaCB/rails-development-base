FROM ruby:2.6.3

ENV TZ="Asia/Tokyo" \
    LANG="ja_JP.UTF-8" \
    LC_CTYPE="ja_JP.UTF-8"

RUN set -x && \
    : "必要ライブラリーのインストール" && \
    apt-get update && \
    apt-get install -y \
    build-essential libpq-dev nodejs \
    imagemagick libmagick++-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*;

COPY ./Gemfile /tmp
RUN cd /tmp && bundle install

WORKDIR /myapp
COPY . /myapp
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh; \
    bundle install

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
