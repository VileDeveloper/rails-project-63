# frozen_string_literal: true

autoload :FormFieldBuilder, File.expand_path('form_field_builder.rb', __dir__)
autoload :HtmlFormBuilder, File.expand_path('html_form_builder.rb', __dir__)

# This is class which has rendering form tags logic
class FormBuilder
  DEFAULT_ACTION = '#'
  DEFAULT_METHOD = 'post'
  FIELDS_AS_WITHOUT_LABEL = %i[submit].freeze

  def initialize(resource, url: DEFAULT_ACTION, method: DEFAULT_METHOD, **options)
    @resource = resource
    @form_attributes = options.merge(action: url, method:)
    @input_fields = []
  end

  def render_html
    form_for_render = { field_tag: 'form', tag_parameters: @form_attributes }
    input_fields_for_render = get_input_fields_for_render(@resource, @input_fields)

    HtmlFormBuilder.build(
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

  def get_input_fields_for_render(resource, input_fields)
    input_fields.map do |input_field|
      field_name = input_field[:field_name]
      as = input_field[:as]
      parameters = input_field[:parameters]

      get_fields_array(resource, field_name, as, **parameters)
    end.flatten
  end

  def get_fields_array(resource, field_name, as, **parameters)
    fields = []

    fields << FormFieldBuilder.new(resource, field_name, :label, **parameters).build if field_needs_lable?(as)
    fields << FormFieldBuilder.new(resource, field_name, as, **parameters).build

    fields
  end

  def field_needs_lable?(as)
    fields_with_lable = FormFieldBuilder::FIELDS_AS_KIND.keys - FIELDS_AS_WITHOUT_LABEL

    fields_with_lable.include?(as)
  end
end
