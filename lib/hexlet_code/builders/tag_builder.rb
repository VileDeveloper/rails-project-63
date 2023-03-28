# frozen_string_literal: true

# Module generate html tag by parameters
module TagBuilder
  UNPAIRED_TAGS = %w[br hr img input meta].freeze

  class << self
    def build(tag, **options)
      body = yield if block_given?

      if UNPAIRED_TAGS.include?(tag)
        build_unpaired(tag, options)
      else
        build_paired(tag, options, body)
      end
    end

    private

    def build_paired(tag, attributes, body)
      tag_attributes = attributes_for_tag(attributes)

      "<#{tag}#{tag_attributes}>#{body}</#{tag}>"
    end

    def build_unpaired(tag, attributes)
      tag_attributes = attributes_for_tag(attributes)

      "<#{tag}#{tag_attributes}>"
    end

    def attributes_for_tag(attributes)
      return '' if attributes.empty?

      tag_attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      " #{tag_attrs}"
    end
  end
end
