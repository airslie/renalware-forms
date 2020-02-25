# frozen_string_literal: true

module Renalware::Forms
  class Homecare::Pdf
    # Given an Args instance containing a provider (eg :fresenius) and a version (eg 1),
    # get the document class for e.g. Renalware::Forms::Fresenius::Homecare::Document
    # and use it to build a new PDF with the data (patient name etc supplied in args)
    def self.generate(args)
      raise ArgumentError unless args
      raise(ArgumentError, "Missing provider") unless args.provider
      raise(ArgumentError, "Missing provider") if args.provider == ""
      raise(ArgumentError, "Version must be >0") if args.version.to_i == 0

      provider = args.provider.to_s.capitalize
      version = "V#{args.version.to_i}"
      document_klass_name = "#{provider}::Homecare::#{version}::Document"
      document_klass = Renalware::Forms.const_get(document_klass_name)
      document_klass.build(args)
    rescue NameError
      raise(
        ArgumentError,
        "No PDF forms found for provider=#{args.provider} version=#{args.version} "\
        "trying to resolve Renalware::Forms::#{document_klass_name}"
      )
    end
  end
end
