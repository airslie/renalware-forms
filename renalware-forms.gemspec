$:.push File.expand_path("lib", __dir__)

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
  spec.description = "The home for various forms for external providers e.g. home care prescriptions"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "activesupport"
  spec.add_dependency "activemodel"
  spec.add_dependency "attr_extras", "~> 6.2"
  spec.add_dependency "prawn", "~> 2.2"
  spec.add_dependency "prawn-table", "~> 0.2"
  spec.add_dependency "rake"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pdf-reader"
end
