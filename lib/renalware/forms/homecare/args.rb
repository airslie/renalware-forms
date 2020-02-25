# frozen_string_literal: true

require "virtus"
require "active_model"

module Renalware::Forms
  class Homecare::Args
    include Virtus::Model
    include ActiveModel::Validations

    # The first 2 attrbutes are used to drive what PDF to build
    attribute :provider, String
    attribute :version, Integer

    attribute :title, String
    attribute :given_name, String
    attribute :family_name, String
    attribute :nhs_number, String
    attribute :born_on, Date
    attribute :fmc_patient, String
    attribute :telephone, String
    attribute :hospital_number, String
    attribute :address, String
    attribute :postcode, String
    attribute :modality, String
    attribute :prescriber_name, String
    attribute :prescription_date, Date
    attribute :hospital_name, String
    attribute :hospital_department, String
    attribute :hospital_address, Array[String]
    attribute :po_number, String
    attribute :no_known_allergies, Boolean
    attribute :allergies, Array[String]
    attribute :administration_route, String
    attribute :administration_frequency, String
    attribute :prescription_duration, String
    attribute :administration_device, String

    # validates! will raise eg ActiveModel::StrictValidationFailed: Family name can't be blank
    validates! :family_name, presence: true
    validates! :given_name, presence: true

    def formatted_address
      format_address_array address
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

      add.compact.reject { |line| line == "" }&.uniq&.join("\n")
    end

    def formatted_prescription_date
      return unless prescription_date

      prescription_date
    end

    def allergies_as_list
      Array(allergies).uniq.compact.join("<br>")
    end

    def self.test_data(provider: :generic, version: 1)
      new.tap do |args|
        args.provider = provider
        args.version = version
        args.title = "Mr"
        args.given_name = "Jack"
        args.family_name = "JONES"
        args.nhs_number = "0123456789"
        args.born_on = Date.parse("2001-01-01")
        args.fmc_patient = "123"
        args.telephone = "07000 000001"
        args.hospital_number = "ABC123"
        args.address = ["line1", "", nil, "line2", "line3.   "]
        args.postcode = "TW1 1UU"
        args.modality = "HD"
        args.prescriber_name = "Dr X Yz"
        args.prescription_date = Date.today.to_s
        args.hospital_name = "THE ROYAL LONDON HOSPITAL"
        args.hospital_department = ""
        args.hospital_address = [
          nil,
          "WHITECHAPEL",
          "",
          "LONDON",
          "E1 1FR"
        ]
        args.no_known_allergies = false
        args.allergies = ["Nuts", nil, "Penicillin", "Mown grass"]
        args.administration_frequency = "Daily"
        args.administration_route = "Per Oral"
        args.prescription_duration = "1 month"
        args.administration_device = "device?"

        raise ArgumentError, args.errors unless args.valid?
      end
    end
  end
end
