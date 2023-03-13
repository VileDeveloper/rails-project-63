# frozen_string_literal: true

require_relative 'hexlet_code/version'
autoload :FormFor, File.expand_path('hexlet_code/form_for.rb', __dir__)

# Main module for hexlet_code gem
module HexletCode
  class << self
    def form_for(user, **options)
      form_for_inst = FormFor.new(user, **options)
      yield(form_for_inst) if block_given?

      form_for_inst.render_html
    end
  end
end
