sudo mkdir -p /etc/pykmip/certs
sudo mkdir /etc/pykmip/policies
sudo cp certs/* /etc/pykmip/certs
sudo cp policies/* /etc/pykmip/policies
sudo cp server.conf /etc/pykmip/server.conf
sudo cp client.conf /etc/pykmip/pykmip.conf

sudo mkdir -p /var/run/pykmip
sudo chmod 777 /var/run/pykmip

sudo mkdir -p /var/log/pykmip
sudo chmod 777 /var/log/pykmip

run_server
