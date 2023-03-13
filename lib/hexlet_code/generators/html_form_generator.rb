# frozen_string_literal: true

autoload :Tag, File.expand_path('../tag.rb', __dir__)

# Module generate html form by form_for and input_fields hashes
module HtmlFormGenerator
  class << self
    def generate(form_for:, input_fields:)
      field_tag = form_for[:field_tag]
      tag_parameters = form_for[:tag_parameters]
      input_fields_html = input_fields_html(input_fields)

      ::Tag.build(field_tag, **tag_parameters) { input_fields_html }
    end

    private

    def input_fields_html(input_fields)
      return '' if input_fields.empty?

      input_fields_html_array =
        input_fields.map do |input_field|
          field_tag = input_field[:field_tag]
          tag_parameters = input_field[:tag_parameters]
          tag_body = input_field[:tag_body]

          ::Tag.build(field_tag, **tag_parameters) { tag_body }
        end

      "\n  #{input_fields_html_array.join("\n  ")}\n"
    end
  end
end