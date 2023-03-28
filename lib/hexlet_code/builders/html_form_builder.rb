# frozen_string_literal: true

autoload :TagBuilder, File.expand_path('tag_builder.rb', __dir__)

# Module build html form by form_for and fields hashes
module HtmlFormBuilder
  class << self
    def build(form_for:, fields:)
      field_tag = form_for[:field_tag]
      tag_parameters = form_for[:tag_parameters]
      html_fields = get_html_fields(fields)

      ::TagBuilder.build(field_tag, **tag_parameters) { html_fields }
    end

    private

    def get_html_fields(fields)
      return '' if fields.empty?

      html_fields =
        fields.map do |field|
          field_tag = field[:field_tag]
          tag_parameters = field[:tag_parameters]
          tag_body = field[:tag_body]

          ::TagBuilder.build(field_tag, **tag_parameters) { tag_body }
        end

      "\n  #{html_fields.join("\n  ")}\n"
    end
  end
end
