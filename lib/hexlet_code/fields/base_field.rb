# frozen_string_literal: true

# Parent class for all kinds of fields
class BaseField
  FIELD_TAG = ''

  def initialize(resource, field_name, **parameters)
    @resource = resource
    @field_name = field_name
    @parameters = parameters
  end

  def build
    tag_parameters = collect_tag_parameters(@resource, @field_name, **@parameters)

    {
      field_tag:,
      tag_parameters:,
      tag_body: tag_body(@resource, @field_name)
    }
  end

  private

  def collect_tag_parameters(resource, field_name, **parameters); end

  def tag_body; end

  def field_value(resource, field_name)
    resource.public_send(field_name)
  end

  def field_tag
    FIELD_TAG
  end
end
