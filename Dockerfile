FROM python:slim

MAINTAINER Hollow Man <hollowman@hollowman.ml>

LABEL version="1.0.5"
LABEL repository="https://github.com/HollowMan6/Wechat-Timed-Message"
LABEL homepage="https://hollowman.ml/"
LABEL maintainer="Hollow Man <hollowman@hollowman.ml>"

COPY entrypoint.sh /entrypoint.sh
COPY Wechat-Timed-Message.py /Wechat-Timed-Message.py

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
