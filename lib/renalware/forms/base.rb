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
  end
end
