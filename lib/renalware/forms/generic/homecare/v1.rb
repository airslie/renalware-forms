# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare
    module V1
      extend ActiveSupport::Autoload

      autoload :Base
      autoload :Document
      autoload :Heading
      autoload :PatientDetails
      autoload :Medications
      autoload :Allergies
      autoload :Frequency
      autoload :Signoff
    end
  end
end
