set -e -x

ERLANG_VERSION="1:18.0"
ELIXIR_VERSION="1.0.5-1"

sudo su -c 'echo "deb http://packages.erlang-solutions.com/debian jessie contrib" >> /etc/apt/sources.list.d/erlang.list'

cat << EOF | sudo tee /etc/apt/preferences.d/erlang.pref
Package: esl-erlang
Pin: version $ERLANG_VERSION
Pin-Priority: 1000

Package: erlang-*
Pin: version $ERLANG_VERSION
Pin-Priority: 1000
EOF

wget -q http://packages.erlang-solutions.com/debian/erlang_solutions.asc -O- | sudo su -c 'apt-key add -'

sudo apt-get update
sudo apt-get install erlang-base-hipe erlang-ssh erlang-src erlang-tools erlang-dev elixir=$ELIXIR_VERSION -y --force-yes


git clone https://github.com/ferd/erlang-history
cd erlang-history
sudo make install
cd ~
