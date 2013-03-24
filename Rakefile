require 'rake'

namespace :mordr do
  desc "Start the app"
  task :start do
    sh "bundle"
    sh "ruby mordr/mordr.io.rb"
  end

  desc "Update app"
  task :update do
    sh "git pull"
  end
end

desc "Cleanup Autosaves and other env shit"
task :clean do
  sh 'find . -type f -iname "*~" -exec rm -v {} \;'
  sh 'find . -type f -iname "*#" -exec rm -v {} \;'
end