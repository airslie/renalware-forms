# frozen_string_literal: true

module Renalware::Forms
  class Homecare::Pdf
    def initialize(args)
      raise ArgumentError unless args

      @args = args
    end

    def self.valid?(args)
      new(args).valid?
    end

    def self.generate(args)
      new(args).generate
    end

    def valid?
      args.valid?
      check_args_are_able_to_create_a_pdf
      args.errors.none?
    end

    # Given an Args instance containing a provider (eg :fresenius) and a version (eg 1),
    # get the document class for e.g. Renalware::Forms::Fresenius::Homecare::Document
    # and use it to build a new PDF with the data (patient name etc supplied in args)
    def generate
      document_klass = Renalware::Forms.const_get(document_class_name)
      document_klass.build(args)
    rescue NameError => e
      raise(
        ArgumentError,
        "No PDF forms found for provider=#{args.provider} version=#{args.version} "\
        "trying to resolve Renalware::Forms::#{document_class_name} " \
        "#{e.message}"
      )
    end

    private

    attr_reader :args

    def check_args_are_able_to_create_a_pdf
      unless Renalware::Forms.const_defined?(document_class_name)
        args.errors.add(
          :base,
          "Supplied Provider and Version cannot be resolved to any homecare form"
        )
      end
    end

    def document_class_name
      @document_class_name ||= begin
        provider = args.provider.to_s.capitalize
        version = "V#{args.version.to_i}"
        "#{provider}::Homecare::#{version}::Document"
      end
    end
  end
end
