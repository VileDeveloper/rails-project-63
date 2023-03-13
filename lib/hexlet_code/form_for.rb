# frozen_string_literal: true

autoload :FormField, File.expand_path('form_field.rb', __dir__)
autoload :HtmlFormGenerator, File.expand_path('generators/html_form_generator.rb', __dir__)

# This is class which has rendering form tags logic
class FormFor
  DEFAULT_ACTION = '#'
  DEFAULT_METHOD = 'post'

  def initialize(user, url: DEFAULT_ACTION, method: DEFAULT_METHOD, **options)
    @user = user
    @form_attributes = options.merge(action: url, method:)
    @input_fields = []
  end

  def render_html
    form_for_render = { field_tag: 'form', tag_parameters: @form_attributes }
    input_fields_for_render = input_fields_for_render(@user, @input_fields)

    HtmlFormGenerator.generate(
      form_for: form_for_render,
      input_fields: input_fields_for_render
    )
  end

  def input(field_name, as: :default, **parameters)
    @input_fields << { field_name:, as:, parameters: }
  end

  def submit(value = 'Save', as: :submit, **parameters)
    @input_fields << { field_name: value, as:, parameters: }
  end

  private

  def input_fields_for_render(user, input_fields)
    input_fields.map do |input_field|
      field_name = input_field[:field_name]
      as = input_field[:as]
      parameters = input_field[:parameters]

      form_fields_array(user, field_name, as, **parameters)
    end.flatten
  end

  def form_fields_array(user, field_name, as, **parameters)
    fields = []

    fields << FormField.new(user, field_name, :label, **parameters).build if as != :submit
    fields << FormField.new(user, field_name, as, **parameters).build

    fields
  end
end
