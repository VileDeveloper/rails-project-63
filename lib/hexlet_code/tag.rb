# frozen_string_literal: true

module HexletCode
  # Module generate html tag by parameters
  module Tag
    PAIRED_TAGS = %w[div form head html label p span table ul].freeze
    UNPAIRED_TAGS = %w[br hr img input meta].freeze

    class << self
      def build(tag, **options)
        body = yield if block_given?

        if PAIRED_TAGS.include?(tag)
          build_paired(tag, options, body)
        elsif UNPAIRED_TAGS.include?(tag)
          build_unpaired(tag, options)
        else
          raise 'Unknown tag!'
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
end
