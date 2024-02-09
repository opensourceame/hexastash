class UploadsController < ApplicationController
  before_action :set_upload, only: %i[ show destroy ]

  def index
    @uploads = Upload.order('created_at desc').all
  end

  def show
    @size    = params[:size].presence    || :thumbnail
    @format  = params[:type].presence    || :jpg
    @quality = params[:quality].presence || 100

    @options = {
      resize_to_limit: Image::SIZE_OPTIONS[@size.to_sym],
      format:          @format,
      saver:           { quality: @quality.to_i }
    }
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # POST /uploads or /uploads.json
  def create
    @upload = Upload.new
    @upload.file.attach(upload_params[:file])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to upload_url(@upload), notice: "Upload was successfully created." }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1 or /uploads/1.json
  def destroy
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url, notice: "Upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_upload
    @upload = Upload.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def upload_params
    params[:upload]&.permit(:file)
  end
end
