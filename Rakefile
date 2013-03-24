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