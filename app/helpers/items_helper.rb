# frozen_string_literal: true
module ItemsHelper

  def item_property_values(item)
    item.property_values
  end

  def key_features_values(item)
    # item.property_values.joins(:property).where(properties: Property.key_features)
    item.property_values.where(property_id: Property.key_features.ids)
  end

end
