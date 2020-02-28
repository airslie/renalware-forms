# frozen_string_literal: true

require "zeitwerk"
require "prawn"
require "prawn/table"
require "attr_extras"

# Set up autoloading with zeitwerk
# As we are nested in lib/renalware/forms, be sure to push an absolute
# path to the lib folder.
loader = Zeitwerk::Loader.new
loader.push_dir File.expand_path("../", __dir__)
loader.setup

module Renalware
  module Forms
  end
end
