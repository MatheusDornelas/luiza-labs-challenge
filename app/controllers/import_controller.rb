# frozen_string_literal: true

class ImportController < ApplicationController
  def import_file
    File.open(params[:file].tempfile, 'r') do |file|
      FileParserService.new(file).parse_lines
    end

    head :no_content
  end
end
