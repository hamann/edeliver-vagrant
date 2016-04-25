set -e -x

sudo apt-get install libreadline-dev libncurses-dev libssl-dev libxslt-dev libffi-dev libtool -y --force-yes

ERLANG_VERSION=18.3
asdf plugin-add erlang https://github.com/HashNuke/asdf-erlang.git
asdf install erlang $ERLANG_VERSION
echo "erlang ${ERLANG_VERSION}" >> ~/.tool-versions

git clone https://github.com/ferd/erlang-history
cd erlang-history
make install
cd ~
