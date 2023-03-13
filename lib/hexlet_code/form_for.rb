# frozen_string_literal: true

autoload :Tag, File.expand_path('tag.rb', __dir__)
autoload :FormField, File.expand_path('form_field.rb', __dir__)

# This is class which has rendering form tags logic
class FormFor
  DEFAULT_ACTION = '#'
  DEFAULT_METHOD = 'post'

  def initialize(user, url: DEFAULT_ACTION, method: DEFAULT_METHOD, **options)
    @user = user
    @form_attributes = options.merge(action: url, method: method)
    @input_fields = []
  end

  def render_html
    input_fields_html = input_fields_html(@user, @input_fields)

    ::Tag.build('form', **@form_attributes) { input_fields_html }
  end

  def input(field_name, as: :default, **parameters)
    @input_fields << { field_name: field_name, as: as, parameters: parameters }
  end

  private

  def input_fields_html(user, input_fields)
    return '' if input_fields.empty?

    input_fields_html_array =
      input_fields.map do |input_field|
        field_name = input_field[:field_name]
        as = input_field[:as]
        parameters = input_field[:parameters]

        FormField.new(user, field_name, as, **parameters).render_html
      end

    "\n  #{input_fields_html_array.join("\n  ")}\n"
  end
end
