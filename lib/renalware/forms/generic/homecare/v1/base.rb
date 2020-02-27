# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Base < Renalware::Forms::Base
      pattr_initialize :document, :args
      TABLE_WIDTH = 555

      def table_styles(**options)
        {
          cell_style: {
            padding: [1, 5, 1, 1],
            border_width: 0.5,
            border_color: "AAAAAA",
            **options
          }
        }
      end

      def heading(text, **options)
        {
          content: text,
          font_style: :bold,
          **options
        }
      end
    end
  end
end
