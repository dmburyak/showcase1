class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  def index
    @images = Image.all
  end

  def show; end

  def new
    @image = Image.new
  end

  def edit; end

  def create
    @image = Image.new(image_params)

    if @image.save
      format.html { redirect_to image_url(@image), notice: 'Image was successfully created.' }
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
    if @image.update(image_params)
      format.html { redirect_to image_url(@image), notice: 'Image was successfully updated.' }
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  def destroy
    @image.destroy

    format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_params
    params.require(:image).permit(:url, :order, :item_id)
  end

end
