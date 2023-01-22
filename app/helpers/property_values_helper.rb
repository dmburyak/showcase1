# frozen_string_literal: true
module PropertyValuesHelper

  def property_name(property_id)
    Property.find(property_id).name
  end
end
