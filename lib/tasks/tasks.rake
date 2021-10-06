# frozen_string_literal: true

desc "Starts irb so we can debug the gem"
task console: :environment do
  exec "irb -r ./lib/renalware/forms"
end
