set -e -x

sudo apt-get install nodejs -y --force-yes
sudo ln -s /usr/bin/nodejs /usr/bin/node
curl -L --insecure https://www.npmjs.org/install.sh | sudo bash
