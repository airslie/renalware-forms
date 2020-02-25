# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Base < Renalware::Forms::Base
      pattr_initialize :document, :args
    end
  end
end
