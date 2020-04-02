# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Document < Base
      pattr_initialize :args

      def self.build(args)
        new(args).tap(&:build)
      end

      def document
        @document ||= Prawn::Document.new(
          page_size: "A4",
          page_layout: :portrait,
          margin: [25, 25, 10, 25]
        )
      end

      def build
        Prawn::Font::AFM.hide_m17n_warning = true
        [
          Heading,
          PatientDetails,
          Medications,
          Allergies,
          PrescriptionDurations,
          DeliveryFrequencies,
          Signoff,
          Footer
        ].each { |klass| klass.new(document, args).build }
      end
    end
  end
end
