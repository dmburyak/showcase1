class ModelsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'uri/http'

  def get_models

    @seller = Seller.find(params[:seller_id])

    unless params[:main_link].empty?
      main_link = params[:main_link]

      uri = URI.parse(main_link.to_s)
      base_url = uri.scheme + '://' + uri.host

      doc = Nokogiri::HTML(URI.open(main_link))

      xpath = "//script[@id='__NEXT_DATA__']"
      doc2 = doc.xpath(xpath).to_s

      doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">', "")
      doc4 = doc3.sub('</script>', "")
      doc5 = JSON.parse(doc4)
      doc6 = doc5['props']['pageProps']['initialDeviceList'][0]

      item = {
        brand: doc6['brand'],
        name: doc6['model'],
        base_url: base_url,
        model_url: doc6['PDPPageURL'][0]
      }

      @main_page = item
      @model = @seller.models.new(item)
      @model.save
    end

    # redirect_to seller_goods_path @seller

    render 'sellers/goods', status: :accepted
  end

end
