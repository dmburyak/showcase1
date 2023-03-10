# frozen_string_literal: true

class PropertyValuesController < ApplicationController
  before_action :set_property_value, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  def index
    @property_values = PropertyValue.all
  end

  def show; end

  def new
    @prop_id = params[:id]
    @property_value = PropertyValue.new
  end

  def edit; end

  def create
    @property_value = PropertyValue.new(property_value_params)

    if @property_value.save
      # redirect_to property_value_url(@property_value), notice: 'Property_value was successfully created.'
      redirect_back(fallback_location: '/')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property_value.update(property_value_params)
      redirect_to property_value_url(@property_value), notice: 'Value was successfully updated.'
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  def destroy
    @property_value.destroy

    redirect_back(fallback_location: '/')
  end

  private

  def set_property_value
    @property_value = PropertyValue.find(params[:id])
    @prop_id = @property_value.property.id
  end

  def property_value_params
    params.require(:property_value).permit(:property_data, :property_id)
  end
end
