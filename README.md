# Aplicativo Portal-C3
Repositorio da aplicação para o Portal C3 2016.2



## Como rodar

- Instalar ruby 2.2.3
- Rodar `bundle install` no root do projeto (no linux usar `sudo bundle install`)
- Instalar o postgresql na maquina e inserir a database 'portalc3' na mesma (tutorial instalação ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04) (`sudo /etc/init.d/postgresql start` para iniciar o banco) (`createdb portalc3;`)
- Rodar o comando `rake db:migrate` e `rake db:seed` no root do projeto.
- Ainda no root do projeto, se o passo anterior estiver ok, usar `rails s` para subir a aplicação na porta 3000 ou `rails s webrick` na plataforma Windows

## Guia de commit:

O guia de commits afim de manter uma boa organização e caso algo saia errado um fácil rollback será:

1. Criar sua branch local/remota
2. Fazer os commits necessários nessa branch
3. Realizar um pull request para fazer o merge com a branch master
