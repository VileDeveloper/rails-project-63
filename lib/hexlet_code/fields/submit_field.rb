# frozen_string_literal: true

autoload :Tag, File.expand_path('../tag.rb', __dir__)
autoload :BaseField, File.expand_path('base_field.rb', __dir__)

# Submit field class for saving form
class SubmitField < BaseField
  FIELD_TAG = 'input'
  FIELD_TYPE = 'submit'

  private

  def collect_tag_parameters(_user, field_name, **parameters)
    tag_parameters = {}

    tag_parameters[:type] = FIELD_TYPE
    tag_parameters[:value] = field_name

    tag_parameters.merge(parameters)
  end

  def tag_body(_user, _field_name)
    ''
  end

  def field_tag
    FIELD_TAG
  end
end
