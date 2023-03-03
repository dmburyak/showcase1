class ModelsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'uri/http'

  def get_models

    @seller = Seller.find(params[:seller_id])

    unless params[:main_link].empty?
      main_link = params[:main_link]

      uri = URI.parse(main_link.to_s)
      base_url = "#{uri.scheme}://#{uri.host}"
      
      doc = Nokogiri::HTML(URI.open(main_link))
                    .xpath("//script[@id='__NEXT_DATA__']").to_s
                    .sub('<script id="__NEXT_DATA__" type="application/json">', '')
                    .sub('</script>', '')

      doc = JSON.parse(doc)
      doc = doc['props']['pageProps']['initialDeviceList']

      doc&.each do |model|

        item = {
          brand: model['brand'],
          name: model['model'],
          base_url: base_url,
          model_url: model['PDPPageURL'][0]
        }

        @model = @seller.models.find_by(name: item[:name])

        if @model.nil?
          @seller.models.create(item)
        else
          @model.update(item)
        end

      end

      @main_page = main_link

    end

    redirect_to seller_goods_path @seller

  end

end
