# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

def app_root
  File.expand_path("../", __FILE__)
end

def pid_file
  pid_path = File.expand_path("/var/run/vote")
  File.join(pid_path, "puma.pid")
end

def state_file
  pid_path = File.expand_path("/var/run/vote")
  File.join(pid_path,"puma.state")
end

def sidekiq_pid
  pid_path = File.expand_path("/var/run/vote")
  File.join(pid_path,"sidekiq.pid")
end


namespace :puma do

  desc "Start puma"
  task :start do
    if File.exists? pid_file
      abort 'Puma is already runing'
    else
      if system("bundle exec puma -q -d -e development -C #{app_root}/puma.rb")
        sleep(8)
        puts "Started and runing with pid: #{File.read pid_file}" if File.exists? pid_file
      end
    end
  end

  desc "Stop puma"
  task :stop do
    if File.exists? pid_file
      system("bundle exec pumactl -S #{state_file} stop")
      sleep(8)
      File.delete pid_file if File.exists? pid_file
    else
      puts "Puma is not runing. What's wrong with you?"
    end
  end

  desc "Reboot puma"
  task :reboot do
    if File.exists? pid_file
      Rake::Task["puma:stop"].invoke
      sleep(2)
    end
    Rake::Task["puma:start"].invoke
  end

  desc "Restart puma peacefully"
  task :restart do
    if File.exists? state_file
      puts 'OK' if system("bundle exec pumactl -S #{state_file} phased-restart")
    else
      Rake::Task["puma:start"].invoke
    end

  end

end