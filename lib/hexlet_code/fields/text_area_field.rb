# frozen_string_literal: true

autoload :BaseField, File.expand_path('base_field.rb', __dir__)

# TextArea field class for generate correct tag
class TextAreaField < BaseField
  FIELD_TAG = 'textarea'
  DEFAULT_COLS = '20'
  DEFAULT_ROWS = '40'

  private

  def collect_tag_parameters(_resource, field_name, **parameters)
    tag_parameters = {}

    tag_parameters[:name] = field_name
    tag_parameters[:cols] = DEFAULT_COLS
    tag_parameters[:rows] = DEFAULT_ROWS

    tag_parameters.merge(parameters)
  end

  def tag_body(resource, field_name)
    field_value(resource, field_name)
  end

  def field_tag
    FIELD_TAG
  end
end
