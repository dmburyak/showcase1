# frozen_string_literal: true

class GoodsController < ApplicationController
  include GoodsHelper

  def create

    seller = get_seller

    @phone = seller.phones.new(get_phone_data)

    if @phone.save
      # redirect_to phone_url(@phone), notice: 'Phone was successfully created.'
    else
      # render :new, status: :unprocessable_entity
    end

  end

end
