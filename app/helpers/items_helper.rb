# frozen_string_literal: true
module ItemsHelper

  def item_property_values(item)
    item.property_values
  end

  def key_features_values(item)
    item.property_values.where(property_id: Property.key_features.ids)
  end

  def non_key_features_values(item)
    item.property_values.where(property_id: Property.non_key_features.ids)
  end

  def prop_values(id)
    PropertyValue.where(property_id: id)
  end

  def checked_value(item, id)
    item.property_values.find_by(property_id: id)&.id
  end

  def value_with_link(b)
    b.radio_button + link_to(b.text, property_value_path(b.object.id))
  end

end
