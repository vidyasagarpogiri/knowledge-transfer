# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :dev do
  task :reset do
    puts "----Installing Gems----"
    system('bundle install')  
    [ "db:drop", "db:create", "db:migrate", "db:seed"].each { |t| puts "#{t}......"; Rake::Task[t].invoke }
  end
end
