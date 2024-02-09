class UploadsController < ApplicationController

  def index
    @uploads = Upload.all
  end
end
