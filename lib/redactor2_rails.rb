require 'redactor2_rails/version'
require 'orm_adapter'

module Redactor2Rails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']

  autoload :Http, 'redactor2_rails/http'
  autoload :Devise, 'redactor2_rails/devise'

  module Backend
    autoload :CarrierWave, 'redactor2_rails/backend/carrierwave'
  end
  require 'redactor2_rails/orm/base'
  require 'redactor2_rails/orm/active_record'
  require 'redactor2_rails/orm/mongoid'
  require 'redactor2_rails/engine'

  mattr_accessor :images_file_types, :files_file_types, :devise_user, :image_model, :file_model
  @@images_file_types = ['jpg', 'jpeg', 'png', 'gif', 'tiff']
  @@files_file_types = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'rtf', 'txt']


  def self.image_model
    @image_model || Redactor2Rails::Image
  end

  def self.file_model
    @file_model || Redactor2Rails::File
  end

  def self.devise_user
    @devise_user || :user
  end

  def self.devise_user_key
    "#{self.devise_user.to_s}_id".to_sym
  end
end
