# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :dev do

  task :reset do
    system('echo "$(tput setaf 7)$(tput setab 1)********Installing Gems********$(tput sgr 0)"')
    system('bundle install')  
    [ "db:drop", "db:create", "db:migrate", "db:seed"].each { |t| puts "#{t}......"; Rake::Task[t].invoke }
    system("rm -rf *~")
    system("rm -rf *.*~")
    system("rm -rf */*/*.*~")
    system("rm -rf */*/*/*.*~")
  end
  
  task :codeDiff do
    system('echo "$(tput setaf 7)$(tput setab 1)********Modified code snippets********$(tput sgr 0)"')
    system('git diff')
    system('echo "$(tput setaf 7)$(tput setab 1)********List of modified or newly Created files in your system********$(tput sgr 0)"')
    system('git status')
  end
  
  
end
