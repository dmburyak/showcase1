module SellersHelper

  def get_goods(url)
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::HTML(URI.open(url))

    # xpath = "//script[@id='__NEXT_DATA__']"
    # doc2 = doc.xpath(xpath).to_s
    # doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">',"")
    # doc4 = doc3.sub('</script>',"")
    # doc5 = JSON.parse(doc4)
    # doc6 = doc5['props']['pageProps']['initialDeviceList'][0]
    # @main_page = doc6['largeImageURL']
    # @main_page = doc6['model']
    # @main_page = doc6['color']
    # @main_page = doc6['PDPPageURL']


    # xpath_name = "//span[contains(@class,'product-header')]"
    # name = doc.xpath(xpath_name).text()
    #
    # xpath_capacity = "//fieldset[contains(@id,'Capacity')]//div[@role='heading']"
    # capacity = doc.xpath(xpath_capacity)[0].text()
    #
    # xpath_full_price = "(//input[@name='priceOptionLabel'])[2]/@aria-label"
    # full_price = doc.xpath(xpath_full_price)
    # full_price = full_price.to_s.sub('Full retail price ','')

    xpath = "//script[@id='__NEXT_DATA__']"
    doc2 = doc.xpath(xpath).to_s
    doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">',"")
    doc4 = doc3.sub('</script>',"")
    doc5 = JSON.parse(doc4)

    # doc6 = doc5['props']['pageProps']['productField']['details']['skuItems']
    # doc6_1 = doc6['sku2820220']
    # doc_1_uniqueURLName = doc6_1['uniqueURLName']
    # doc_1_name = doc6_1['shortDisplayName']
    # doc_1_color = doc6_1['color']
    # doc_1_capacity = doc6_1['size']
    # doc_1_uom = doc6_1['uom'] # => GB
    # doc_1_price_list = doc6_1['priceList'] # []
    # doc_1_price_list_0_full = doc_1_price_list[0]['msrp']

    doc7 = doc5['props']['pageProps']['productField']['details']['selectedSku']
    doc7_capacity = doc7['capacity']
    doc7_color = doc7['color']
    doc7_img = doc7['mediaTypes']['images']['masterImageUrl']
    doc7_shortDisplayName = doc7['shortDisplayName']
    doc7_size = doc7['size']
    doc7_uom = doc7['uom'] # GB
    doc7_uom = doc7['priceList'][0]['msrp']

    @main_page = doc7_img
  end

end
