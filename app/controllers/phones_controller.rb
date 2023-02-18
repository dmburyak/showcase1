# frozen_string_literal: true

class PhonesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new edit update destroy]
  before_action :set_phone, only: %i[show edit update destroy]
  before_action :reformat, only: :update

  def index
    @q = Phone.ransack(params[:q])
    @pagy, @phones = pagy(@q.result(distinct: true).includes(:property_values))
    # debugger
  end

  def search
    index
    render :index, status: :accepted
  end

  def show; end

  def new
    @phone = Phone.new
  end

  def edit; end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      redirect_to phone_url(@phone), notice: 'Phone was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @phone.update(phone_params)
      redirect_to phone_url(@phone), notice: 'Phone was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @phone.destroy
    redirect_to phones_url, notice: 'Phone was successfully destroyed.'
  end

  def filter
    @q = Phone.ransack(params[:q])
    @selection = {}
    unless params[:filter].nil?
      groups = params[:filter].keys
      options = params[:filter].values

      options.each_index do |i|
        values = options[i].values.flatten
        values.delete('')

        next if values.empty?

        ids = PropertyValue.select(:id).where(property_data: values)
        @phones = if @phones.nil?
                    Phone.joins(:phones_property_values).where('phones_property_values.property_value_id': ids)
                  else
                    @phones.where(id: [Phone.joins(:phones_property_values).select(:id)
                                            .where('phones_property_values.property_value_id': ids)])
                  end
        @selection[groups[i]] = values
      end
    end

    @phones = Phone.all if @selection.empty?

    @pagy, @phones = pagy(@phones)

    render :index, status: :accepted
  end

  private

  def set_phone
    @phone = Phone.friendly.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:name, :description, :price, :url, :seller_id, property_value_ids: [])
  end

  def reformat
    if request.parameters['phone']['property']
      phone = request.parameters.delete('phone')
      property = phone.delete('property')
      values = []
      property.each_value do |elem|
        values << elem['property_value_ids'] unless elem['property_value_ids'].empty?
      end
      phone['property_value_ids'] = values
      request.parameters['phone'] = phone
    end
  end
end
