#! /bin/sh

# Install rvm with bundler
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=ruby-2.2.0 --with-gems="bundler"


