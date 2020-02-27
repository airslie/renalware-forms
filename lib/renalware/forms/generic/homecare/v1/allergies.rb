# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Allergies < Base
      def build
        move_down 30
        font_size 10
        text "Known Allergies", style: :bold
        args.allergies.each do |allergy|
          text allergy
        end
      end
    end
  end
end
