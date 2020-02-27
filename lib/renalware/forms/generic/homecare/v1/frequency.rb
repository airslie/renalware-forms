# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Frequency < Base
      def build
        font_size 10
        move_down 20
        row1 = [heading("Repeat prescription for:")]
        args.delivery_frequencies.each do |freq|
          row1.concat << cell_with_trailing_checkbox(freq)
        end

        row2 = [heading("Frequency of deliveries:")]
        args.delivery_frequencies.each do |freq|
          row2.concat << cell_with_trailing_checkbox(freq)
        end

        table(
          [row1, row2],
          **table_styles(border_width: 0, padding: [1, 30, 1, 0])
        )
      end
    end
  end
end
