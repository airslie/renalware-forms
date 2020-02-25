# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Document < Base
      pattr_initialize :args

      def self.build(args)
        new(args).tap(&:build)
      end

      def document
        @document ||= Prawn::Document.new(page_size: "A4", page_layout: :portrait, margin: 15)
      end

      def build; end
    end
  end
end
