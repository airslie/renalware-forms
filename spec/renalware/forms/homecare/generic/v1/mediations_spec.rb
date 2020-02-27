# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::Medications do
    it do
      args = Renalware::Forms::Homecare::Args.new
      args.medications << Renalware::Forms::Homecare::Args::Medication.new(
        date: "2020-01-01",
        drug: "Drug1",
        dose: "Dose1",
        route: "Route1",
        frequency: "Freq1"
      )
      args.medications << Renalware::Forms::Homecare::Args::Medication.new(
        date: "2020-02-02",
        drug: "Drug2",
        dose: "Dose2",
        route: "Route2",
        frequency: "Freq2"
      )
      doc = test_prawn_doc

      described_class.new(doc, args).build

      text = extract_text_from_prawn_doc(doc)

      expect(text).to include("2020-01-01")
      expect(text).to include("Drug1")
      expect(text).to include("Dose1")
      expect(text).to include("Route1")
      expect(text).to include("Freq1")
      expect(text).to include("Drug2")
    end
  end
end
