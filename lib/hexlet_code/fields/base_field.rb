# frozen_string_literal: true

# Parent class for all kinds of fields
class BaseField
  FIELD_TAG = ''

  def initialize(user, field_name, **parameters)
    @user = user
    @field_name = field_name
    @parameters = parameters
  end

  def build
    tag_parameters = collect_tag_parameters(@user, @field_name, **@parameters)

    {
      field_tag: field_tag,
      tag_parameters: tag_parameters,
      tag_body: tag_body(@user, @field_name)
    }
  end

  private

  def collect_tag_parameters(user, field_name, **parameters); end

  def tag_body; end

  def field_value(user, field_name)
    user.public_send(field_name)
  end

  def field_tag
    FIELD_TAG
  end
end
