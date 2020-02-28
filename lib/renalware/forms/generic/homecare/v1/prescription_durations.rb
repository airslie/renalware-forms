# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    # List our the available prescription_durations and is selected_prescription_duration
    # supplied then mark that one as checked.
    class PrescriptionDurations < Base
      def build
        font_size 10
        move_down 20
        row = [heading("Repeat prescription for:")]
        args.prescription_durations.each do |duration|
          checked = duration == args.selected_prescription_duration
          row.concat << cell_with_leading_checkbox(duration, checked: checked)
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
