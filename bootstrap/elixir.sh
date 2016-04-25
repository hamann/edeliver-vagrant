set -e -x

ELIXIR_VERSION=1.2.3

asdf plugin-add elixir https://github.com/HashNuke/asdf-elixir.git
asdf install elixir $ELIXIR_VERSION
echo "elixir ${ELIXIR_VERSION}" >> ~/.tool-versions
