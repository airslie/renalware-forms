# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Generic
  RSpec.describe Homecare::V1::PrescriptionDurations do
    def extract_pdf_text(args)
      doc = test_prawn_doc
      described_class.new(doc, args).build
      extract_text_from_prawn_doc(doc)
    end

    it do
      args = Renalware::Forms::Homecare::Args.new(
        prescription_durations: ["3 months", "6 months", "12 months"]
      )

      text = extract_pdf_text(args)

      expect(text).to include("Repeat prescription for")
      expect(text).to include("❏ 3 months")
      expect(text).to include("❏ 6 months")
      expect(text).to include("❏ 12 months")
    end

    it "works wher there are no prescription_durations supplied" do
      args = Renalware::Forms::Homecare::Args.new

      text = extract_pdf_text(args)

      expect(text).to include("Repeat prescription for")
    end

    context "when there is a selected prescription_duration" do
      it "indicates that duration has been selected eg for checking a box" do
        args = Renalware::Forms::Homecare::Args.new(
          prescription_durations: ["3 months", "6 months", "12 months"],
          selected_prescription_duration: "6 months"
        )

        text = extract_pdf_text(args)

        expect(text).to include("❏ 3 months")
        expect(text).to include("■ 6 months")
        expect(text).to include("❏ 12 months")
      end
    end
  end
end
