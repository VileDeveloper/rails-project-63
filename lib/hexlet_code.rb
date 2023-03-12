# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Main module for hexlet_code gem
module HexletCode
  autoload(:Tag, "#{__dir__}/hexlet_code/tag.rb")
end
