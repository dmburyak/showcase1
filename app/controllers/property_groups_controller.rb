# frozen_string_literal: true

class PropertyGroupsController < ApplicationController
  before_action :set_property_group, only: %i[show edit update destroy]

  def index
    @property_groups = PropertyGroup.all
  end

  def show; end

  def new
    @property_group = PropertyGroup.new
  end

  def edit; end

  def create
    @property_group = PropertyGroup.new(property_group_params)

    if @property_group.save
      redirect_to property_group_url(@property_group), notice: 'Property group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property_group.update(property_group_params)
      redirect_to property_group_url(@property_group), notice: 'Property group was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property_group.destroy
    redirect_to property_groups_url, notice: 'Property group was successfully destroyed.'
  end

  private

  def set_property_group
    @property_group = PropertyGroup.find(params[:id])
  end

  def property_group_params
    params.require(:property_group).permit(:name, :main, :order)
  end
end
