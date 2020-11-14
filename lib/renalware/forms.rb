# frozen_string_literal: true

require "zeitwerk"
require "prawn"
require "prawn/table"
require "attr_extras"

# Note we don't use Zeitwerk::Loader.for_gem because we our root to be
# the directly above this one (/lib/renalware) and for_gem uses __dir__ as the
# root.
loader = Zeitwerk::Loader.new
loader.push_dir File.expand_path("..", __dir__)
loader.ignore File.expand_path("../tasks", __dir__)
loader.ignore File.expand_path("**/assets", __dir__)
# loader.log!
loader.setup

module Renalware
  module Forms
    VERSION = "0.1.13"
  end
end
