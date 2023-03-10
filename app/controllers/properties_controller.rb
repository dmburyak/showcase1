# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  # def index
  #   @properties = Property.includes(:property_group)
  #                         .where(property_groups: { name: 'Key Features' })
  #                         .order(:order)
  # end

  def index
    @properties_key = Property.key_features
    @properties_non_key = Property.non_key_features
  end

  def show; end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to property_url(@property), notice: 'Property was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      redirect_to property_url(@property), notice: 'Property was successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :order, :filter, :property_group_id, :key_feature)
  end
end
