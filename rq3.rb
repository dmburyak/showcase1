parameters = { "_method" => "patch",
      "authenticity_token" => "7NcQNi2wxsnqrSwC9QU3Icu1ocN1xR6pKH7YH7aqXEdNZV65ktdvO1VRerEfInK8xl2WCH0duWHuX5OCtx1JFg",
      "item" =>
        { "name" => "Samsung Galaxy S22, 128 GB",
          "description" =>
            "Take and share adorable pet portraits, even in low-light, with the 50 MP rear camera. Video calls with your loved one look incredible on the 6.1-inch 120Hz adaptive display. Seamless camera detailing and high-quality finish combine for one eye-catching smartphone.",
          "price" => "799.99",
          "url" => "https://www.att.com/buy/phones/samsung-galaxy-s22.html",
          "seller_id" => "2",
          "property" =>
            { "1" => { "property_value_ids" => "3" },
              "2" => { "property_value_ids" => "" },
              "3" => { "property_value_ids" => "" },
              "4" => { "property_value_ids" => "" },
              "5" => { "property_value_ids" => "" },
              "6" => { "property_value_ids" => "" },
              "7" => { "property_value_ids" => "" },
              "8" => { "property_value_ids" => "" },
              "9" => { "property_value_ids" => "" },
              "10" => { "property_value_ids" => "" },
              "11" => { "property_value_ids" => "" },
              "12" => { "property_value_ids" => "" },
              "13" => { "property_value_ids" => "" },
              "14" => { "property_value_ids" => "" },
              "15" => { "property_value_ids" => "" },
              "16" => { "property_value_ids" => "" },
              "17" => { "property_value_ids" => "" },
              "18" => { "property_value_ids" => "" },
              "19" => { "property_value_ids" => "" },
              "20" => { "property_value_ids" => "" },
              "21" => { "property_value_ids" => "" },
              "22" => { "property_value_ids" => "" },
              "23" => { "property_value_ids" => "" },
              "24" => { "property_value_ids" => "" },
              "25" => { "property_value_ids" => "" },
              "26" => { "property_value_ids" => "" },
              "27" => { "property_value_ids" => "7" },
              "28" => { "property_value_ids" => "" },
              "29" => { "property_value_ids" => "" },
              "30" => { "property_value_ids" => "" },
              "31" => { "property_value_ids" => "" },
              "32" => { "property_value_ids" => "" },
              "33" => { "property_value_ids" => "" },
              "34" => { "property_value_ids" => "" },
              "35" => { "property_value_ids" => "" },
              "36" => { "property_value_ids" => "" },
              "37" => { "property_value_ids" => "" },
              "38" => { "property_value_ids" => "" },
              "39" => { "property_value_ids" => "" },
              "40" => { "property_value_ids" => "" } } },
      "commit" => "Update Item",
      "controller" => "items",
      "action" => "update",
      "id" => "1" }

def reformat parameters
  item = parameters.delete('item')
  property = item.delete('property')
  values = []
  property.each_value do |elem|
    values << elem["property_value_ids"] unless elem["property_value_ids"].empty?
  end
  item['property_value_ids'] = values
  parameters['item'] = item
  parameters
end


puts (reformat(parameters))