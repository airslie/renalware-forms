# frozen_string_literal: true

require "zeitwerk"
require "prawn"
require "prawn/table"
require "attr_extras"

loader = Zeitwerk::Loader.new
loader.push_dir File.expand_path("..", __dir__)
loader.ignore File.expand_path("../tasks", __dir__)
loader.ignore File.expand_path("**/assets", __dir__)
loader.inflector = Zeitwerk::GemInflector.new(File.join(__dir__, "forms"))
loader.setup

module Renalware
  module Forms
  end
end
