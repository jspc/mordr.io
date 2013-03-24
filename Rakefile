require 'rake'

namespace :mordr do
  desc "Start the app"
  task :start do
    sh "ruby mordr/mordr.io.rb"
  end

  desc "Update app"
  task :update do
    git pull
  end
end