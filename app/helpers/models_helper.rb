module ModelsHelper
  require 'json'

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

    xpath = "//script[@id='__NEXT_DATA__']"
    doc = Nokogiri::HTML(URI.open(url))
                  .xpath(xpath)
                  .to_s
                  .sub('<script id="__NEXT_DATA__" type="application/json">', '')
                  .sub('</script>', '')

    doc = JSON.parse(doc)
    sku_items = doc['props']['pageProps']['productField']['details']['skuItems']

    sku_items.each do |item|
      variant = {
        name: item[1]['displayName'],
        color: item[1]['color'],
        storage: item[1]['capacity']
      }

      phone_variant = @model.variants.find_by(name: variant[:name])
      if phone_variant
        phone_variant.update(variant)
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
                  .xpath(xpath).to_s
                  .sub('<script id="__NEXT_DATA__" type="application/json">', '')
                  .sub('</script>', '')

    doc = JSON.parse(doc)

    items_data = doc['props']['pageProps']['productField']['details']['skuItems']

    items_data.each do |item|

      next if item[1]['displayName'] != Variant.find(item_id).name

      phone = {
        name: "#{item[1]['shortDisplayName']}, #{item[1]['capacity']}, #{item[1]['color']}",
        url: "#{@model.base_url}/buy/phones/#{item[1]['uniqueURLName']}.html"
      }

      seller_phone = @seller.phones.find_by(name: phone[:name])

      @phone = if seller_phone
                 seller_phone.update(phone)
                 seller_phone
               else
                 @seller.phones.create(phone)
               end

      item_images_parse(doc, item[0])

      item_properties_parse(doc, item[1])

    end

  end

  def item_images_parse(hash, skuids)

    hash_array = search_value(hash, 'herocarousel')

    hash_array.each do |hash|

      next unless hash['master']['skuIDs'].index(skuids)

      hash['master']['assetURLs'].each_with_index do |img_url, index|
        image = {
          url: @model.base_url + img_url,
          order: index + 1
        }

        phone_image = @phone.images.find_by(url: image[:url])

        if phone_image
          phone_image.update(image)
        else
          @phone.images.create(image)
        end

      end
    end
  end

  def item_properties_parse(doc, phone_data)

    doc = doc['props']['pageProps']['idpcmsContent']['idp-cms-feed']

    specifications = search_value(doc, 'deviceSpecification')

    # get all model properties from site
    props = Hash.new

    specifications.each do |arr1|
      arr1['master']['accordionData']&.each do |arr2|

        property_key = Property.find_by(name: arr2['master']['key'])

        next if property_key.nil?

        property_value = arr2['master']['value']
                         .gsub('<br>', ' ')
                         .gsub('<br/>', ' ')
                         .gsub('<i>', '')
                         .sub('checkbox', 'yes')

        props[property_key.id] = property_value
      end
    end

    description = search_value(doc, 'contentFragments')['overview'][0]['master']['overviewDescription']
                  .sub('<p>', '')
                  .sub('</p>', '')
                  .sub('<sup>1</sup>', '')

    props[44] = description

    price = phone_data['priceList'][0]['msrp']
    props[43] = price

    color = phone_data['color']
    props[41] = color

    capacity = phone_data['capacity']
    props[26] = capacity

    # insert new model properties into base and set property_values to phone
    phone_property_values = []

    props.each do |key, val|

      get_values = PropertyValue.where(property_id: key)

      if get_values.empty?
        new_value = PropertyValue.create({ property_id: key, property_data: val })
        phone_property_values << new_value.id
      else
        a = 0
        get_values.each do |item|
          if item.property_data == val
            phone_property_values << item.id
            a = 1
          end
        end
        if a != 1
          new_value = PropertyValue.create({ property_id: key, property_data: val })
          phone_property_values << new_value.id
        end
      end
    end

    @phone.update({ "property_value_ids": phone_property_values })

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
