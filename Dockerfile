FROM python:slim

MAINTAINER Hollow Man <hollowman@hollowman.ml>

LABEL version="1.1.5"
LABEL repository="https://github.com/HollowMan6/Wechat-Timed-Message"
LABEL homepage="https://hollowman.ml/"
LABEL maintainer="Hollow Man <hollowman@hollowman.ml>"

COPY entrypoint.sh /entrypoint.sh
COPY Wechat-Timed-Message.py /Wechat-Timed-Message.py
COPY requirements.txt /requirements.txt

RUN chmod +x /entrypoint.sh
RUN pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir -r /requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
