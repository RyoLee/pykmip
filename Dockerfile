FROM python:3.7

RUN apt-get install git

RUN git clone https://github.com/jzendle/pykmip.git
RUN pip install PyKMIP
RUN mkdir -p /etc/pykmip/certs;  mkdir /etc/pykmip/policies 
RUN mkdir -p /var/log/pykmip;  chmod 777 /var/log/pykmip
RUN cd pykmip \
	&& tar zxvf crt.gz \ 
	&& chmod +x run_server \ 
	&& cp certs/* /etc/pykmip/certs \
	&& cp policies/* /etc/pykmip/policies \
	&& cp server.conf /etc/pykmip/server.conf  \
	&& cp client.conf /etc/pykmip/pykmip.conf \
	&& mkdir -p /var/run/pykmip \
	&& chmod 777 /var/run/pykmip \
	&& mkdir -p /var/log/pykmip \
	&& chmod 777 /var/log/pykmip 

WORKDIR /pykmip
EXPOSE 5696

CMD ["sh","/pykmip/run_server"]


