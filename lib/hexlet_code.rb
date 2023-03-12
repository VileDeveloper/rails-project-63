# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Main module for hexlet_code gem
module HexletCode
  autoload(:Tag, "#{__dir__}/hexlet_code/tag.rb")

  DEFAULT_METHOD_FORM_FOR = 'post'

  class << self
    def form_for(_user, **options)
      attributes = decorate_attributes(options)

      ::HexletCode::Tag.build('form', **attributes)
    end

    private

    def decorate_attributes(attributes)
      decorated_attributes = add_attribute_action(attributes)

      decorated_attributes.merge(method: DEFAULT_METHOD_FORM_FOR)
    end

    def add_attribute_action(attributes)
      url = attributes[:url]

      return attributes.merge(action: '#') if url.nil?

      attributes.merge!(action: url)
      attributes.except(:url)
    end
  end
end
