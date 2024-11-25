# frozen_string_literal: true

class ImportController < ApplicationController
  def import_file
    file = File.new(params[:file].tempfile).read

    cache_id = SecureRandom.uuid
    REDIS_CLIENT.set(cache_id, file)

    FileParserJob.perform_async(cache_id)

    head :no_content
  end
end
