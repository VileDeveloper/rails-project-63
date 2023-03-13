# frozen_string_literal: true

autoload :InputField, File.expand_path('fields/input_field.rb', __dir__)
autoload :TextAreaField, File.expand_path('fields/text_area_field.rb', __dir__)
autoload :SubmitField, File.expand_path('fields/submit_field.rb', __dir__)
autoload :LabelField, File.expand_path('fields/label_field.rb', __dir__)

# This is main Field class with choice fields kind
class FormField
  def initialize(user, field_name, as, **parameters)
    @user = user
    @field_name = field_name
    @as = as
    @parameters = parameters
  end

  def build
    field_class = field_class_by_as(@as)

    field_class.new(@user, @field_name, **@parameters).build
  end

  private

  def field_class_by_as(as)
    case as
    when :text
      TextAreaField
    when :submit
      SubmitField
    when :label
      LabelField
    else
      InputField
    end
  end
end
