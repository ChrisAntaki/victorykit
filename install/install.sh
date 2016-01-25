alias install="sudo apt-get install -y"
alias update="sudo apt-get update"

update

cd /vagrant/

# Git
install git

# Databases
install postgresql
install redis-server

# Node.js
install npm
sudo npm install -g n
sudo n lts

# Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable --ruby
source /home/vagrant/.rvm/scripts/rvm
rvm install ruby-2.0.0
gem update --system
echo "gem: --no-document" > ~/.gemrc

# Gems
gem install bundler
install g++
install libmysqlclient-dev
install libpq-dev
install libqt5webkit5-dev
install libxml2-dev
install libxslt-dev
install mysql-client
install qt5-default
install qtdeclarative5-dev
bundle
