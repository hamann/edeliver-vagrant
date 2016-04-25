set -e -x

NODEJS_VERSION="5.2.0"

asdf plugin-add nodejs https://github.com/HashNuke/asdf-nodejs
asdf install nodejs $ELIXIR_VERSION
echo "nodejs ${NODEJS_VERSION}" >> ~/.tool-versions
