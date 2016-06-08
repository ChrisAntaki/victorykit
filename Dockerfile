FROM ubuntu:latest

# Install Ruby 2.0.0
RUN apt-get update -y
RUN apt-get install curl -y
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
ENV PATH /usr/local/rvm/gems/ruby-2.0.0-p648/bin:/usr/local/rvm/gems/ruby-2.0.0-p648@global/bin:/usr/local/rvm/rubies/ruby-2.0.0-p648/bin:/usr/local/rvm/bin:$PATH

# Gems
RUN gem update --system
RUN echo "gem: --no-document" > /root/.gemrc
RUN gem install bundler

# Prereqs
RUN apt-get install git -y
RUN apt-get install libxml2-dev -y
RUN apt-get install libxslt-dev -y
RUN apt-get install mysql-client -y
RUN apt-get install postgresql-client -y
RUN apt-get install libmysqlclient-dev -y
RUN apt-get install libpq-dev -y
RUN apt-get install g++ -y
RUN apt-get install libqt5webkit5-dev -y
RUN apt-get install qt5-default -y
RUN apt-get install qtdeclarative5-dev -y

# Bundle
COPY install/Gemfile /app/Gemfile
WORKDIR /app/
RUN bundle

# Node.js
RUN apt-get install npm -y
RUN npm install -g n
RUN n latest

# Start
WORKDIR /app/source
