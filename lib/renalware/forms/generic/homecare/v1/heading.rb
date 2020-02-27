# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Heading < Base
      def build
        move_down 10
        font_size 12
        text "PO: #{args.po_number}"
        font_size 8
        text "RW ref: #{args.hospital_number}"
        text "Drugs types: #{args.drug_type}"
        move_down 30
        font_size 16
        text "Home Delivery Medication List", style: :bold
        font_size 8
        text "As at #{args.generated_at}"
        image(
          File.join(File.dirname(__dir__), "v1/assets/nhs_logo.jpg"),
          width: 60,
          at: [490, 800]
        )
      end
    end
  end
end
