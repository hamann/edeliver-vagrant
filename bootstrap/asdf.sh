set -e -x

git clone https://github.com/HashNuke/asdf.git ~/.asdf
echo ". $HOME/.asdf/asdf.sh" >> /home/$USER/.zshrc

# for edeliver
echo ". $HOME/.asdf/asdf.sh" >> /home/$USER/.profile
