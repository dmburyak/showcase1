# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new edit update destroy]
  before_action :set_item, only: %i[show edit update destroy]
  before_action :reformat, only: :update

  def index
    @items = Item.includes(:property_values).limit(10)
  end

  def show; end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_url(@item), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :url, :seller_id, property_value_ids: [])
  end

  def reformat
    if request.parameters['item']['property']
      item = request.parameters.delete('item')
      property = item.delete('property')
      values = []
      property.each_value do |elem|
        values << elem["property_value_ids"] unless elem["property_value_ids"].empty?
      end
      item['property_value_ids'] = values
      request.parameters['item'] = item
    end
  end
end
