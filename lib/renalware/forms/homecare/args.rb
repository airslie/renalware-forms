# frozen_string_literal: true

require "dry-types"
require "dry-struct"
require "active_model"

# rubocop:disable Metrics/ClassLength
module Renalware::Forms
  module Types
    include Dry.Types()
  end

  class Homecare::Args < Dry::Struct
    include ActiveModel::Validations

    class Medication < Dry::Struct
      include ActiveModel::Validations

      attribute :date, Types::Params::Date
      attribute :drug, Types::String
      attribute :dose, Types::String
      attribute :route, Types::String
      attribute :frequency, Types::String
    end

    # The first 2 attrbutes are used to drive what PDF to build
    attribute :provider, Types::Coercible::String
    attribute :version, Types::Integer
    attribute :title, Types::String.default("")
    attribute :given_name, Types::String
    attribute :family_name, Types::String
    attribute :nhs_number, Types::String.default("")
    attribute :born_on, Types::Params::Date
    attribute :modality, Types::String.default("")
    attribute :telephone, Types::String.default("")
    attribute :hospital_number, Types::String.default("")
    attribute :address, Types::Array.of(Types::Coercible::String).default([].dup, shared: true)
    attribute :postcode, Types::String.default("")
    attribute :prescriber_name, Types::String.default("")
    attribute :prescription_date, Types::Params::Date
    attribute :hospital_name, Types::String.default("")
    attribute :hospital_department, Types::String.default("")
    attribute :hospital_address, Types::Array.of(Types::Coercible::String).default([], shared: true)
    attribute :hospital_telephone, Types::String.default("")
    attribute :po_number, Types::String.default("")
    attribute :generated_at, (Types::Params::DateTime.default { DateTime.now })
    attribute :no_known_allergies, Types::Bool
    attribute :allergies, Types::Array.of(Types::Coercible::String)
    attribute :drug_type, Types::Coercible::String
    # attribute :prescription_duration, Types::String
    attribute :administration_device, Types::String.default("")
    attribute :medications, Types::Array.of(Medication).default([].dup, shared: true)
    attribute :consultant, Types::String.default("")
    attribute(
      :delivery_frequencies,
      Types::Array.of(Types::Coercible::String).default(["3 months", "6 months"].freeze)
    )
    attribute(
      :prescription_durations,
      Types::Array
        .of(Types::Coercible::String)
        .default(["3 months", "6 months", "12 months"].freeze)
    )
    attribute :selected_prescription_duration, Types::String.default("") # e.g. "6 months"
    attribute :selected_delivery_frequency, Types::String.default("") # e.g. "6 months"

    validates :family_name, presence: true
    validates :given_name, presence: true
    validates :provider, presence: true
    validates :version, presence: true
    validate :medications_are_present

    def patient_name
      name = [family_name, given_name].compact.join(", ")
      name += " (#{title})" if title.to_s != ""
      name
    end

    def formatted_address
      format_address_array address
    end

    def formatted_address_and_postcode
      format_address_array(address << postcode)
    end

    def formatted_hospital_address
      format_address_array hospital_address
    end

    def formatted_hospital_name_and_address
      arr = [hospital_name] + hospital_address
      format_address_array arr
    end

    def format_address_array(add)
      return unless add&.is_a?(Array)

      add.compact.reject { |line| line == "" }.uniq&.join("\n")
    end

    def formatted_prescription_date
      return unless prescription_date

      prescription_date
    end

    def allergies_as_list
      Array(allergies).uniq.compact.join("<br>")
    end

    def self.test_data(provider: :generic, version: 1)
      args = new(
        provider: provider,
        version: version,
        title: "Mr",
        given_name: "Jack",
        family_name: "JONES",
        nhs_number: "0123456789",
        born_on: Date.parse("2001-01-01"),
        telephone: "07000 000001",
        hospital_number: "ABC123",
        modality: "HD",
        address: ["line1", "", nil, "line2", "line3   "],
        postcode: "TW1 1UU",
        prescriber_name: "Dr X Yz",
        prescription_date: Date.today.to_s,
        consultant: "Dr Pepper",
        hospital_name: "THE ROYAL LONDON HOSPITAL",
        hospital_telephone: "0000 000001",
        hospital_department: "Renal",
        hospital_address: [
          "The Royal London Hospital",
          "Barts Health NHS Trust",
          "Whitechapel",
          "LONDON",
          "E1 1FR",
          "UK",
          "Tel: 0800 00000000",
          "Another line"
        ],
        no_known_allergies: false,
        allergies: ["Nuts", nil, "Penicillin", "Mown grass"],
        drug_type: "ESA",
        prescription_duration: "1 month",
        administration_device: "device?",
        po_number: "P123",
        delivery_frequencies: ["1 week", "3 months", "6 months", "12 month"],
        prescription_durations: ["3 months", "6 months", "12 months"],
        selected_prescription_duration: "6 months",
        selected_delivery_frequency: "6 months"
      )

      args.medications << Medication.new(
        date: Date.today,
        drug: "Example drug",
        dose: "1 unit",
        route: "PO",
        frequency: "3"
      )

      raise ArgumentError, args.errors unless args.valid?
      args
    end

    def medications_are_present
      if medications.size == 0
        errors.add(:base, "There are no home delivery prescriptions for this drug type")
      end
    end
  end
end
# rubocop:enable Metrics/ClassLength
