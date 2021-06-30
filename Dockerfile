FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories &&\
apk add python3-dev py3-pip py3-cryptography  py3-greenlet  &&\
pip install --upgrade pip &&\
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn PyKMIP &&\
mkdir -p /etc/pykmip/certs &&\
mkdir -p /var/log/pykmip
COPY ./pykmip/* /etc/pykmip/

EXPOSE 5696

CMD ["pykmip-server","-d","/etc/pykmip/server.db"]
