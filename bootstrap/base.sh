set -e -x

sudo su -c 'echo "deb http://ftp.de.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list.d/backports.list'

sudo apt-get update

sudo apt-get install git-core build-essential tmux zsh inotify-tools vim -y --force-yes

git clone --recursive https://github.com/sorin-ionescu/prezto.git /home/vagrant/.zprezto
cd /home/vagrant/.zprezto/runcoms
for rcfile in `ls *`; do ln -s /home/vagrant/.zprezto/runcoms/$rcfile /home/vagrant/.$rcfile; done
echo "vagrant" | chsh -s /usr/bin/zsh

echo 'export PATH=$PATH:./node_modules/.bin' >> ~/.zshrc
echo 'export PGUSER="ed_web"' >> ~/.zshrc
echo 'export PGDATABASE="ed_production"' >> ~/.zshrc
echo 'export PORT=4000' >> ~/.zshrc

cat << EOF | tee /home/vagrant/.zpreztorc
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt' \
  'history-substring-search'

zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:prompt' theme 'sorin'
EOF

cat << EOF | tee /home/vagrant/.tmux.conf
set-window-option -g mode-keys vi
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
bind p paste-buffer
set -g status-bg colour232
set -g status-fg white
EOF

cat << EOF | tee /home/vagrant/.ssh/config
HOST *
  StrictHostKeyChecking no
EOF
