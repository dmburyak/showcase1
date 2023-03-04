class ModelsController < ApplicationController
  include ModelsHelper
  require 'nokogiri'
  require 'open-uri'
  require 'uri/http'

  def get_models

    @seller = Seller.find(params[:seller_id])

    model_parse unless params[:main_link].nil? || params[:main_link].empty?

    variants_parse(params[:model_id]) unless params[:model_id].nil? || params[:model_id].empty?

    item_parse(params[:item_id]) unless params[:item_id].nil? || params[:item_id].empty?

    redirect_to seller_models_path @seller
  end

end

