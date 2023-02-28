class ModelsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def get_models
    main_link = params(:main_link)

    doc = Nokogiri::HTML(URI.open(main_link))

    xpath = "//script[@id='__NEXT_DATA__']"
    doc2 = doc.xpath(xpath).to_s
    doc3 = doc2.sub('<script id="__NEXT_DATA__" type="application/json">',"")
    doc4 = doc3.sub('</script>',"")
    doc5 = JSON.parse(doc4)
    doc6 = doc5['props']['pageProps']['initialDeviceList'][0]
    @main_page = doc6['largeImageURL']

  end

end
