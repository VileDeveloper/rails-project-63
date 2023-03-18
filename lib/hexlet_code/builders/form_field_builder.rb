# frozen_string_literal: true

require 'active_support/inflector'

autoload :InputField, File.expand_path('../fields/input_field.rb', __dir__)
autoload :TextAreaField, File.expand_path('../fields/text_area_field.rb', __dir__)
autoload :SubmitField, File.expand_path('../fields/submit_field.rb', __dir__)
autoload :LabelField, File.expand_path('../fields/label_field.rb', __dir__)

# This is main Field class with choice fields kind
class FormFieldBuilder
  FIELDS_AS_KIND =
    {
      text: 'TextAreaField',
      submit: 'SubmitField',
      label: 'LabelField',
      default: 'InputField'
    }.freeze

  def initialize(resource, field_name, as, **parameters)
    @resource = resource
    @field_name = field_name
    @as = as
    @parameters = parameters
  end

  def build
    field_class = FIELDS_AS_KIND[@as || :default].constantize

    field_class.new(@resource, @field_name, **@parameters).build
  end
end
