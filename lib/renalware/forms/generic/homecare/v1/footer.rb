# frozen_string_literal: true

module Renalware::Forms::Generic
  module Homecare::V1
    class Footer < Base
      def build
        font_size 6
        text_box "v#{Renalware::Forms::VERSION}", at: [350, 10], width: 200, align: :right
      end
    end
  end
end
