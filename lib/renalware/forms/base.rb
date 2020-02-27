# frozen_string_literal: true

module Renalware::Forms
  class Base
    include Prawn::View
    EMPTY_CHECKBOX = "o     " # in ZapfDingbats
    CHECKBOX = "3    "

    # lower case o is an empty checkbox in ZapfDingbats
    def cell_with_leading_checkbox(text, checked: false, **options)
      if checked
        {
          content: "<font name='ZapfDingbats'>#{CHECKBOX}</font>#{text}",
          inline_format: true,
          **options
        }
      else
        {
          content: "<font name='ZapfDingbats'>#{EMPTY_CHECKBOX}</font>#{text}",
          inline_format: true,
          **options
        }
      end
    end

    def cell_with_trailing_checkbox(text, checked: false, **options)
      if checked
        {
          content: "#{text} <font name='ZapfDingbats'>#{CHECKBOX}</font>",
          inline_format: true,
          **options
        }
      else
        {
          content: "#{text} <font name='ZapfDingbats'>#{EMPTY_CHECKBOX}</font>",
          inline_format: true,
          **options
        }
      end
    end

    def underlined_table_style
      {
        cell_style: {
          padding: [2, 5, 2, 0],
          border_width: 0.5,
          border_color: "AAAAAA",
          borders: [:bottom]
        }
      }
    end

    def borderless_table_style
      {
        cell_style: {
          border_width: 0.5
        }
      }
    end
  end
end
