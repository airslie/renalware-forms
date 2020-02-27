desc "Starts irb so we can debug the gem"
task :console do
  exec "irb -r ./lib/renalware"
end
