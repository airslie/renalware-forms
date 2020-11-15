# frozen_string_literal: true

require "zeitwerk"
require "prawn"
require "prawn/table"
require "attr_extras"

# Custom inflector.
# See lib/zeitwerk/gem_inflector.rb in the zeitwerk gem
class TheInflector < Zeitwerk::GemInflector
  def initialize(root_file)
    namespace     = "renalware/forms"
    lib_dir       = File.expand_path("../..", root_file)
    @version_file = File.join(lib_dir, namespace, "version.rb")
  end
end

# Note we don't use Zeitwerk::Loader.for_gem because we our root to be
# the directly above this one (/lib/renalware) and for_gem uses __dir__ as the
# root.
# loader = Zeitwerk::Loader.for_gem
# loader.inflector = TheInflector.new(File.join(__dir__, "forms"))
# loader.setup

loader = Zeitwerk::Loader.new
loader.push_dir File.expand_path("..", __dir__)
loader.ignore File.expand_path("../tasks", __dir__)
loader.ignore File.expand_path("**/assets", __dir__)
loader.inflector = TheInflector.new(File.join(__dir__, "forms"))
# loader.log!
loader.setup

module Renalware
  module Forms
  end
end
