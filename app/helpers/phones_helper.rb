# frozen_string_literal: true
module PhonesHelper

  include Pagy::Frontend

  def phone_property_values(phone)
    phone.property_values
  end

  def key_features_values(phone)
    phone.property_values.where(property_id: Property.key_features.ids)
  end

  def non_key_features_values(phone)
    phone.property_values.where(property_id: Property.non_key_features.ids)
  end

  def non_key_features_values_part1(phone)
    phone.property_values.where(property_id: Property.non_key_features_part1.ids)
  end

  def non_key_features_values_part2(phone)
    phone.property_values.where(property_id: Property.non_key_features_part2.ids)
  end

  def select_features_part(phone, part)
    if part == 1
      non_key_features_values_part1(phone)
    else
      non_key_features_values_part2(phone)
    end
  end

  def prop_values(id)
    PropertyValue.where(property_id: id)
  end

  def checked_value(phone, id)
    phone.property_values.find_by(property_id: id)&.id
  end

  def value_with_link(b)
    b.radio_button + link_to(b.text, property_value_path(b.object.id))
  end

end
