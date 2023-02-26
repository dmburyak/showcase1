# frozen_string_literal: true

class SellersController < ApplicationController
  include SellersHelper

  before_action :set_seller, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  def index
    @sellers = Seller.all
  end

  def show; end

  def new
    @seller = Seller.new
  end

  def edit; end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      if request.referer.include? 'sellers/new'
        redirect_to seller_url(@seller), notice: 'Seller was successfully created.'
      else
        redirect_to request.referer, notice: 'Seller was successfully created.'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to seller_url(@seller), notice: 'Seller was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @seller.destroy

    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
    end
  end

  def goods
    @seller = Seller.find(params[:seller_id])
    # @main_link = params[:main_link]
    # @main_link = 'https://www.att.com/buy/phones/browse/samsung'
    @main_link = 'https://www.att.com/buy/phones/samsung-galaxy-s23-ultra.html'

    return if @main_link.nil?

    get_goods(@main_link) unless @main_link.empty?
    render 'goods', status: :accepted
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name)
  end
end
