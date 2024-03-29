# frozen_string_literal: true

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.

require "simplecov"
SimpleCov.start

require "tempfile"
require "pdf-reader"
require "./lib/renalware/forms"

def pdf_reader_from(prawn_doc)
  file = Tempfile.new("pdf")
  prawn_doc.render_file file
  PDF::Reader.new(file)
end

def test_prawn_doc
  Prawn::Document.new(
    page_size: "A4",
    page_layout: :portrait,
    margin: 15
  )
end

def default_test_arg_values
  {
    provider: :generic,
    version: 1,
    modality: "HD",
    telephone: "",
    hospital_number: nil,
    nhs_number: nil,
    consultant: nil,
    postcode: nil,
    hospital_department: nil,
    hospital_telephone: nil,
    prescriber_name: nil,
    po_number: "134",
    administration_device: nil,
    given_name: "John",
    family_name: "SMITH",
    title: "Mr",
    no_known_allergies: true,
    allergies: [],
    drug_type: :esa,
    born_on: "2019-01-01",
    prescription_date: "2019-01-01"
  }.dup
end

def extract_text_from_prawn_doc(doc)
  pdf_reader_from(doc).pages.map(&:text).join
end

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
