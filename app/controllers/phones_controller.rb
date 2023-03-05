# frozen_string_literal: true

class PhonesController < ApplicationController
  include PhonesHelper

  before_action :authenticate_admin!, only: %i[new edit update destroy]
  before_action :set_phone, only: %i[show edit update destroy]
  before_action :reformat, only: :update

  def index
    @pagy, @phones = pagy(Phone.all)
  end

  def filter
    @selection = {}

    @phones = if params[:f].nil?
                Phone.all
              else
                filtering(params[:f])
              end

    @pagy, @phones = pagy(@phones)

    render :index, status: :accepted
  end

  def search
    @phones = if params[:query].nil?
                Phone.all
              else
                searching(params[:query])
              end

    @pagy, @phones = pagy(@phones)

    render :index, status: :accepted
  end

  def show;end

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

  private

  def set_phone
    @phone = Phone.friendly.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:name, :description, :price, :url, :seller_id, property_value_ids: [])
  end

end
