module ModelsHelper

  def model_parse(url)
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
  end

  def variants_parse(url)

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

end
