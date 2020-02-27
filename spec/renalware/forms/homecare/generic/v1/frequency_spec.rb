# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::Frequency do
    it do
      args = Renalware::Forms::Homecare::Args.new(
        delivery_frequencies: ["Once", "3 months", "6 months"]
      )
      doc = test_prawn_doc

      described_class.new(doc, args).build

      text = extract_text_from_prawn_doc(doc)

      expect(text).to include("Frequency of deliveries")
      expect(text).to include("Once")
      expect(text).to include("3 months")
      expect(text).to include("6 months")
    end
  end
end
