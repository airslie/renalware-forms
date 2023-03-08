# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "renalware/forms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "renalware-forms"
  spec.version     = Renalware::Forms::VERSION
  spec.authors     = ["Airslie Ltd"]
  spec.email       = ["dev@aisrlie.com"]
  spec.homepage    = "http://airslie.com"
  spec.summary     = "PDF library for Renalware forms"
  spec.description = "The home for various forms for external providers eg home care prescriptions"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ["README.md"]

  spec.add_dependency "activemodel"
  spec.add_dependency "attr_extras"
  spec.add_dependency "matrix"
  spec.add_dependency "prawn", "~> 2.2"
  spec.add_dependency "prawn-table", "~> 0.2"
  spec.add_dependency "rake"
  spec.add_dependency "virtus"
end
