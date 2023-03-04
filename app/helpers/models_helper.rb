module ModelsHelper

  def model_parse
    url = 'https://www.att.com/buy/phones/browse/samsung'
    uri = URI.parse(url.to_s)
    base_url = "#{uri.scheme}://#{uri.host}"

    doc = Nokogiri::HTML(URI.open(url))
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
  end

  def variants_parse(model_id)

    @model = Model.find(model_id)
    url = @model.base_url + @model.model_url

    doc = Nokogiri::HTML(URI.open(url))
    xpath = "//script[@id='__NEXT_DATA__']"
    doc2 = doc.xpath(xpath).to_s
    doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">', "")
    doc4 = doc3.sub('</script>', "")
    doc5 = JSON.parse(doc4)
    doc6 = doc5['props']['pageProps']['productField']['details']['skuItems']

    doc6.each do |item|
      variant = {
        name: item[1]['displayName'],
        color: item[1]['color'],
        storage: item[1]['capacity']
      }

      var = @model.variants.find_by(name: variant[:name])
      if var
        var.update(variant)
      else
        @model.variants.create(variant)
      end
    end
  end

  def item_parse(item_id)

    model_id = Variant.find(item_id).model_id

    @model = Model.find(model_id)

    url = @model.base_url + @model.model_url

    xpath = "//script[@id='__NEXT_DATA__']"

    doc = Nokogiri::HTML(URI.open(url))

    xpath_description = "//div[@id='accordion-content-overview']//p"

    doc2 = doc.xpath(xpath).to_s
    doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">', "")
    doc4 = doc3.sub('</script>', "")
    doc5 = JSON.parse(doc4)
    doc6 = doc5['props']['pageProps']['productField']['details']['skuItems']
    #
    # doc6.each do |item|
    #
    #   next if item[1]['displayName'] != Variant.find(item_id).name
    #
    #   phone = {
    #     name: "#{item[1]['shortDisplayName']}, #{item[1]['capacity']}, #{item[1]['color']}",
    #     # description: doc.xpath(xpath_description).text().sub('battery1', 'battery'),
    #     description: doc5['props']['pageProps']['idpcmsContent']['idp-cms-feed'],
    #     price: item[1]['priceList'][0]['msrp'],
    #     url: "#{@model.base_url}/buy/phones/#{item[1]['uniqueURLName']}.html"
    #   }
    #
    #   seller_phone = @seller.phones.find_by(name: phone[:name])
    #
    #   if seller_phone
    #     seller_phone.update(phone)
    #   else
    #     @seller.phones.create(phone)
    #   end
    #
    #   val = {
    #     text: item[1]['displayName']
    #   }
    #
    #   Temp.first.update(val)
    # end
    val = {
      text: search_value(doc5, 'herocarousel')
    }

    Temp.first.update(val)

  end

  def search_value(hash, target_key)
    hash.each do |key, value|
      if key == target_key
        return value
      elsif value.is_a?(Hash)
        result = search_value(value, target_key)
        return result unless result.nil?
      end
    end
    nil
  end

end
