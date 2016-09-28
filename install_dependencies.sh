echo 'Instalando as dependências do Ruby'
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev imagemagick build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

echo 'Instalando o rbenv, que é um gerenciador de versões do ruby, e instalar o ruby pelo rbenv'
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
rbenv install 2.3.0
rbenv global 2.3.0
ruby -v

echo 'Instalando a gem bundler, para instalar dependências do projeto'
gem install bundler
rbenv rehash

echo 'Instalando e configurando o postgresql'
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev
sudo service postgresql start
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '123456';"

echo 'Instalando dependencias do projeto (Vai demorar um pouco)'
bundle install
rbenv rehash

echo 'Criando e populando base de dados'
rake db:create
rake db:migrate
rake db:seed
