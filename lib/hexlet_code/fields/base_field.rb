# frozen_string_literal: true

autoload :Tag, File.expand_path('../tag.rb', __dir__)

# Parent class for all kinds of fields
class BaseField
  FIELD_TAG = ''

  def initialize(user, field_name, **parameters)
    @user = user
    @field_name = field_name
    @parameters = parameters
  end

  def render_html
    tag_parameters = collect_tag_parameters(@user, @field_name, **@parameters)

    ::Tag.build(field_tag, **tag_parameters) { tag_body(@user, @field_name) }
  end

  private

  def collect_tag_parameters(user, field_name, **parameters); end

  def tag_body; end

  def field_value(user, field_name)
    user.public_send(field_name)
  rescue StandardError
    raise "'public_send': undefined method '#{field_name}' for #{user} (NoMethodError)"
  end

  def field_tag
    FIELD_TAG
  end
end
