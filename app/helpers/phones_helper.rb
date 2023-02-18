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

  def get_filters
    @selection
  end

  def get_search
    params[:q]['name_or_description_or_property_values_property_data_cont']
  end

  def reformat
    if request.parameters['phone']['property']
      phone = request.parameters.delete('phone')
      property = phone.delete('property')
      values = []
      property.each_value do |elem|
        values << elem['property_value_ids'] unless elem['property_value_ids'].empty?
      end
      phone['property_value_ids'] = values
      request.parameters['phone'] = phone
    end
  end

  def filtering(filters)
    groups = filters.keys
    options = filters.values

    options.each_index do |i|
      values = options[i].values.flatten
      values.delete('')

      next if values.empty?

      ids = PropertyValue.select(:id).where(property_data: values)
      @phones = if @phones.nil?
                  Phone.joins(:phones_property_values).where('phones_property_values.property_value_id': ids)
                else
                  @phones.where(id: [Phone.joins(:phones_property_values).select(:id)
                                          .where('phones_property_values.property_value_id': ids)])
                end
      @selection[groups[i]] = values
    end
    @selection.empty? ? Phone.all : @phones
  end

end
