# frozen_string_literal: true

class SellersController < ApplicationController
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

    respond_to do |format|
      if @seller.save
        format.html { redirect_to seller_url(@seller), notice: 'Seller was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name)
  end
end
