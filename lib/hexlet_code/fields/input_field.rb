# frozen_string_literal: true

autoload :BaseField, File.expand_path('base_field.rb', __dir__)

# Input field class for generate correct tag
class InputField < BaseField
  FIELD_TAG = 'input'
  FIELD_TYPE = 'text'

  private

  def collect_tag_parameters(resource, field_name, **parameters)
    tag_parameters = {}

    tag_parameters[:name] = field_name
    tag_parameters[:type] = FIELD_TYPE
    tag_parameters[:value] = field_value(resource, field_name)

    tag_parameters.merge(parameters)
  end

  def tag_body(_resource, _field_name)
    ''
  end

  def field_tag
    FIELD_TAG
  end
end
