# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::Signoff do
    it do
      args = Renalware::Forms::Homecare::Args.new(
        consultant: "Dr Pepper"
      )
      doc = test_prawn_doc

      described_class.new(doc, args).build

      text = extract_text_from_prawn_doc(doc)
      expect(text).to include("Dr Pepper")
    end
  end
end
