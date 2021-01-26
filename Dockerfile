FROM python:latest

MAINTAINER Hollow Man <hollowman@hollowman.ml>

LABEL version="1.0.0"
LABEL repository="https://github.com/HollowMan6/Wechat-Timed-Message-Through-Actions"
LABEL homepage="https://hollowman.ml/"
LABEL maintainer="Hollow Man <hollowman@hollowman.ml>"

COPY entrypoint.sh /entrypoint.sh
COPY Wechat-Timed-Message-Through-Actions.py /Wechat-Timed-Message-Through-Actions.py

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
