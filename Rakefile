require 'rake'

namespace :mordr do
  desc "Start the app"
  task :start do
    sh "bundle"
    sh "sass  public/css/style.scss:public/css/style.min.css --style compressed"
    sh "sass  public/css/csswizardry-grids.scss:public/css/grids.css --style compressed"
    sh "unicorn -c $PWD/mordr/unicorn.rb -E production -l 0.0.0.0:3001 -D"
  end

  desc "Update app"
  task :update do
    sh "git pull"
  end

  desc "Slaughter unicorns"
  task :kill do
    sh "for pid in $(ps -o 'pid,comm' -u $(whoami)|grep unicorn|awk '{print $1}'); do kill -9 $pid; done"
  end
end

desc "Cleanup Autosaves and other env shit"
task :clean do
  sh 'find . -type f -iname "*~" -exec rm -v {} \;'
  sh 'find . -type f -iname "*#" -exec rm -v {} \;'
end