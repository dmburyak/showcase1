class ModelsController < ApplicationController
  include ModelsHelper
  require 'nokogiri'
  require 'open-uri'
  require 'uri/http'

  def get_models

    @seller = Seller.find(params[:seller_id])
    unless params[:main_link].nil? || params[:main_link].empty?
      url = params[:main_link].strip!
      model_parse(url)
    end

    unless params[:model_id].nil? || params[:model_id].empty?
      @model = Model.find(params[:model_id])
      url = @model.base_url + @model.model_url
      variants_parse(url)
    end

    redirect_to seller_goods_path @seller
  end

end

