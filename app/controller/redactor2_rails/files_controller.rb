class Redactor2Rails::FilesController < ApplicationController
  before_action :redactor2_authenticate_user!

  def create
    @file = Redactor2Rails.file_model.new

    file = params[:file]
    @file.data = Redactor2Rails::Http.normalize_param(file, request)
    if @file.has_attribute?(:"#{Redactor2Rails.devise_user_key}")
      @file.send("#{Redactor2Rails.devise_user}=", redactor_current_user)
      @file.assetable = redactor_current_user
    end

    if @file.save
      render json: { url: @file.url, name: @file.filename }
    else
      render json: { error: @file.errors }
    end
  end

  private

  def redactor2_authenticate_user!
    if Redactor2Rails.file_model.new.has_attribute?(Redactor2Rails.devise_user)
      super
    end
  end
end
