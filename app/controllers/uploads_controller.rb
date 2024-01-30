class UploadsController < ApplicationController
  before_action :authenticate_user!

  def new
    @upload = current_user.uploads.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)
    if @upload.save
      respond_to do |format|
        format.html { redirect_to uploads_path, notice: 'Upload was successfully created.' }
        format.json { render json: { message: 'success', uploadId: @upload.id }, status: 200 }
      end
    else
      respond_to do |format|
        format.html { render 'new', notice: 'Upload failed.' }
        format.json { render json: { error: @upload.errors.full_messages.join(',')}, status: 400 }
      end
    end
  end

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def destroy
    @upload = Upload.find(params[:id])
    if @upload.destroy
      redirect_to uploads_path, notice: 'Upload was successfully destroyed.'
    else
      redirect_to uploads_path, notice: 'Upload failed to destroy.'
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:image) if params[:upload]
  end
end
