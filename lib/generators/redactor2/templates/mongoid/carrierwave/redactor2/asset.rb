class Redactor2Rails::Asset
  include Mongoid::Document
  include Mongoid::Timestamps

  include Redactor2Rails::Orm::Mongoid::AssetBase

  delegate :url, :current_path, :size, :content_type, :filename, :to => :data
  validates_presence_of :data
end
