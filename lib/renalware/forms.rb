# frozen_string_literal: true

require "prawn"
require "prawn/table"
require "attr_extras"
require "active_support"

module Renalware
  module Forms
    extend ActiveSupport::Autoload

    autoload :Helpers
    autoload :Base
    autoload :Homecare
  end
end
