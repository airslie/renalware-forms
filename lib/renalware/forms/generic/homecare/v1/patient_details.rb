# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class PatientDetails < Base
      def build
        move_down 10
        font_size 10
        table(
          [
            [heading("Name"), args.patient_name],
            [heading("Modality"), args.modality],
            [heading("Date of Birth"), args.born_on],
            [heading("NHS Number"), args.nhs_number],
            [heading("Hospital no"), args.hospital_number],
            [heading("Address"), args.formatted_address_and_postcode]
          ],
          **table_styles(border_width: 0)
        )
      end
    end
  end
end
