
require "./lib/renalware/forms"
require "tempfile"

namespace :forms do
  namespace :generic do
    namespace :homecare do
      include Renalware::Forms::Helpers

      desc "Generate test Generic Homecare Supply PDF V1"
      task :v1 do
        args = Renalware::Forms::Homecare::Args.test_data(provider: :generic, version: 1)
        pdf = Renalware::Forms::Homecare::Pdf.generate(args)
        render_and_open pdf
      end
    end
  end
end
