class Redactor2Rails::File < Redactor2Rails::Asset
  mount_uploader :data, Redactor2RailsFileUploader, mount_on: :data_file_name

  def url_content
    url(:content)
  end
end
