# frozen_string_literal: true

require 'active_support/inflector'

autoload :InputField, File.expand_path('../fields/input_field.rb', __dir__)
autoload :TextField, File.expand_path('../fields/text_field.rb', __dir__)
autoload :SubmitField, File.expand_path('../fields/submit_field.rb', __dir__)
autoload :LabelField, File.expand_path('../fields/label_field.rb', __dir__)

# This is main Field class with choice fields kind
class FormItemBuilder
  def initialize(resource, item_name, item_kind, **parameters)
    @resource = resource
    @item_name = item_name
    @item_kind = item_kind
    @parameters = parameters
  end

  def build
    item_class = "#{@item_kind}_field".camelize.constantize

    item_class.new(@resource, @item_name, **@parameters).build
  end
end
