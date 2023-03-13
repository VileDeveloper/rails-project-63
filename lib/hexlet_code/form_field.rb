# frozen_string_literal: true

autoload :InputField, File.expand_path('fields/input_field.rb', __dir__)
autoload :TextAreaField, File.expand_path('fields/text_area_field.rb', __dir__)

# This is main Field class with choice fields kind
class FormField
  def initialize(user, field_name, as, **parameters)
    @user = user
    @field_name = field_name
    @as = as
    @parameters = parameters
  end

  def render_html
    field_class = field_class_by_as(@as)

    field_class.new(@user, @field_name, **@parameters).render_html
  end

  private

  def field_class_by_as(as)
    case as
    when :text
      TextAreaField
    else
      InputField
    end
  end
end
