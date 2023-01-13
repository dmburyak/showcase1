json.extract! item, :id, :name, :description, :price, :url, :category_id, :subcatogory_id, :seller_id, :property_id, :created_at, :updated_at
json.url item_url(item, format: :json)
