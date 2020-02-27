# frozen_string_literal: true

require "spec_helper"

module Renalware::Forms::Homecare
  RSpec.describe Args do
    describe "#patient_name" do
      subject {
        described_class.new(given_name: "John", family_name: "SMITH", title: title).patient_name
      }

      context "when title present" do
        let(:title) { "Mr" }

        it { is_expected.to eq("SMITH, John (Mr)") }
      end

      context "when title missing" do
        let(:title) { "" }

        it { is_expected.to eq("SMITH, John") }
      end
    end

    describe "#medications" do
      subject { described_class.new.medications }

      it { is_expected.to eq([]) }
    end
  end
end
