class PhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_admin, only: %i[create edit update destroy new]
  before_action :set_photo, only: %i[show edit update destroy]

  # GET /photos or /photos.json
  def index
    @photos = Photo.order(created_at: :desc)
  end

  # GET /photos/1 or /photos/1.json
  def show; end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit; end

  # POST /photos or /photos.json
  def create
    @photo = current_user.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_url(@photo), notice: 'Foto creada exitosamente.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photo_url(@photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:description, :image, :title)
  end

  def check_admin
    return if user_signed_in? && current_user.admin?

    redirect_to root_path, alert: 'No tienes permisos para realizar esta acción.'
  end
end
