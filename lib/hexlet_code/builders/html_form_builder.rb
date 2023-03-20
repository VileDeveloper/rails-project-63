# frozen_string_literal: true

autoload :TagBuilder, File.expand_path('tag_builder.rb', __dir__)

# Module build html form by form_for and fields hashes
module HtmlFormBuilder
  class << self
    def build(form_for:, fields:)
      field_tag = form_for[:field_tag]
      tag_parameters = form_for[:tag_parameters]
      fields_html = fields_html(fields)

      ::TagBuilder.build(field_tag, **tag_parameters) { fields_html }
    end

    private

    def fields_html(fields)
      return '' if fields.empty?

      fields_html_array =
        fields.map do |field|
          field_tag = field[:field_tag]
          tag_parameters = field[:tag_parameters]
          tag_body = field[:tag_body]

          ::TagBuilder.build(field_tag, **tag_parameters) { tag_body }
        end

      "\n  #{fields_html_array.join("\n  ")}\n"
    end
  end
end
