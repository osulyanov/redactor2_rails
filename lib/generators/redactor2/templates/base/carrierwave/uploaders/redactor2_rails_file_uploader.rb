
class Redactor2RailsFileUploader < CarrierWave::Uploader::Base
  include Redactor2Rails::Backend::CarrierWave

  # storage :fog
  storage :file

  def store_dir
    "system/redactor2_assets/files/#{model.id}"
  end

  def extension_white_list
    Redactor2Rails.files_file_types
  end
end
