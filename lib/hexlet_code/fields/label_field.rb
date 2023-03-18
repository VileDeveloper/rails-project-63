# frozen_string_literal: true

autoload :BaseField, File.expand_path('base_field.rb', __dir__)

# Label field class for substitution label before input field
class LabelField < BaseField
  FIELD_TAG = 'label'

  private

  def collect_tag_parameters(_resource, field_name, **_parameters)
    tag_parameters = {}

    tag_parameters[:for] = field_name

    tag_parameters
  end

  def tag_body(resource, field_name)
    field_value(resource, field_name)
  end

  def field_tag
    FIELD_TAG
  end
end
