# frozen_string_literal: true

require "prawn"
require "prawn/table"
require "attr_extras"
require "active_support"

module Renalware::Forms
  module Homecare
    extend ActiveSupport::Autoload

    autoload :Pdf
    autoload :Args
    autoload :Generic
  end
end
