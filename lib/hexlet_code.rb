# frozen_string_literal: true

autoload :HexletCodeVersion, File.expand_path('hexlet_code/version', __dir__)
autoload :FormBuilder, File.expand_path('hexlet_code/builders/form_builder.rb', __dir__)

# Main module for hexlet_code gem
module HexletCode
  include HexletCodeVersion

  class << self
    def form_for(resource, **options)
      form_for_inst = FormBuilder.new(resource, **options)
      yield(form_for_inst) if block_given?

      form_for_inst.render_html
    end
  end
end
