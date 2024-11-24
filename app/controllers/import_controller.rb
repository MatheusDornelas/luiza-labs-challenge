# frozen_string_literal: true

class ImportController < ApplicationController
  def import_file
    file = File.open(params[:file].tempfile, 'r')
    p file
    FileParserJob.perform_async(file)

    head :no_content
  end
end
