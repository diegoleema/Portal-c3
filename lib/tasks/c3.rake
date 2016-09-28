namespace :c3 do

  desc "Inicia o banco de dados, criando-o, migrando-o populando-o"
  task :setup => :environment do
    puts 'Removendo banco de dados, se existir...'
    `rake db:drop`
    puts 'Recriando banco de dados...'
    `rake db:create`
    puts 'Migrando e populando banco de dados...'
    `rake db:migrate db:seed`
  end

end