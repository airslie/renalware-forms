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
      hash = default_test_arg_values.update(delivery_frequencies: ["Once", "3 weeks", "6 weeks"])
      args = Renalware::Forms::Homecare::Args.new(hash)

      text = extract_pdf_text(args)

      expect(text).to include("Frequency of deliveries")
      expect(text).to include("❏ Once")
      expect(text).to include("❏ 3 weeks")
      expect(text).to include("❏ 6 weeks")
    end

    context "when there are no frequencies supplied" do
      it "displays the defaults" do
        args = Renalware::Forms::Homecare::Args.new(**default_test_arg_values)

        text = extract_pdf_text(args)

        expect(text).to include("Frequency of deliveries")
        expect(text).to include("❏ 3 months")
        expect(text).to include("❏ 6 months")
      end
    end

    context "when there is a selected delivery_frequency" do
      it "indicates that frequency has been selected by checking a box" do
        hash = default_test_arg_values.update(
          delivery_frequencies: ["3 months", "6 months", "12 months"],
          selected_delivery_frequency: "6 months"
        )
        args = Renalware::Forms::Homecare::Args.new(hash)

        text = extract_pdf_text(args)

        expect(text).to include("❏ 3 months")
        expect(text).to include("■ 6 months")
        expect(text).to include("❏ 12 months")
      end
    end
  end
end
