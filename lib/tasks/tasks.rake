desc "Starts irb so we can debug the gem"
task :console do
  exec "irb -r ./lib/renalware/forms"
end

namespace :zeitwerk do
  desc "Checks project structure for Zeitwerk compatibility"
  task :check do
    require "renalware/forms"
    Zeitwerk::Loader.eager_load_all
  end
end
