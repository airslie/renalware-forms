# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::DeliveryFrequencies do
    def extract_pdf_text(args)
      doc = test_prawn_doc
      described_class.new(doc, args).build
      extract_text_from_prawn_doc(doc)
    end

    it do
      args = Renalware::Forms::Homecare::Args.new(
        delivery_frequencies: ["Once", "3 weeks", "6 weeks"]
      )

      text = extract_pdf_text(args)

      expect(text).to include("Frequency of deliveries")
      expect(text).to include("❏ Once")
      expect(text).to include("❏ 3 weeks")
      expect(text).to include("❏ 6 weeks")
    end

    context "when there are no frequencies supplied" do
      it "displays the defaults" do
        args = Renalware::Forms::Homecare::Args.new

        text = extract_pdf_text(args)

        expect(text).to include("Frequency of deliveries")
        expect(text).to include("❏ 3 months")
        expect(text).to include("❏ 6 months")
      end
    end
  end
end
