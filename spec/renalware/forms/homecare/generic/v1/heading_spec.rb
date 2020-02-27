# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::Heading do
    it do
      args = Renalware::Forms::Homecare::Args.new(
        po_number: "P123",
        hospital_number: "H123",
        drug_type: "ESA"
      )
      doc = test_prawn_doc

      described_class.new(doc, args).build

      text = extract_text_from_prawn_doc(doc)

      expect(text).to include(args.po_number)
      expect(text).to include(args.hospital_number)
      expect(text).to include(args.drug_type)
      expect(text).to include("Home Delivery Medication List")
    end
  end
end
