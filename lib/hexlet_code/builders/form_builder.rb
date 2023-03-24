# frozen_string_literal: true

autoload :FormItemBuilder, File.expand_path('form_item_builder.rb', __dir__)
autoload :HtmlFormBuilder, File.expand_path('html_form_builder.rb', __dir__)

# This is class which has rendering form tags logic
class FormBuilder
  def initialize(resource, url: '#', method: 'post', **options)
    @resource = resource
    @form_attributes = options.merge(action: url, method:)
    @items = []
  end

  def render_html
    form_for_render = { field_tag: 'form', tag_parameters: @form_attributes }
    fields_for_render = get_items_for_render(@resource, @items)

    HtmlFormBuilder.build(
      form_for: form_for_render,
      fields: fields_for_render
    )
  end

  def input(item_name, as: :default, **parameters)
    @items << { item_name:, item_kind: :label, parameters: }
    @items << { item_name:, item_kind: as, parameters: }
  end

  def submit(value = 'Save', as: :submit, **parameters)
    @items << { item_name: value, item_kind: as, parameters: }
  end

  private

  def get_items_for_render(resource, items)
    items.map do |item|
      item_name = item[:item_name]
      item_kind = item[:item_kind]
      parameters = item[:parameters]

      FormItemBuilder.new(resource, item_name, item_kind, **parameters).build
    end.flatten
  end
end
