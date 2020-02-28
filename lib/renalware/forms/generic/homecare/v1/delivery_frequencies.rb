# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class DeliveryFrequencies < Base
      def build
        font_size 10
        move_down 10
        row = [heading("Frequency of deliveries:")]
        args.delivery_frequencies.each do |freq|
          row.concat << cell_with_leading_checkbox(freq)
        end

        table(
          [row],
          **table_styles(border_width: 0, padding: [1, 30, 1, 0]),
          column_widths: { 0 => 150 }
        )
      end
    end
  end
end
