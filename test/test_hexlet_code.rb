# frozen_string_literal: true

require_relative 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    user_struct = Struct.new(:name, keyword_init: true)

    @user = user_struct.new(name: 'Crash Dummy')
  end

  def test_form_for_success
    form_for_string = ::HexletCode.form_for(@user)

    assert { form_for_string == '<form action="#" method="post"></form>' }
  end

  def test_form_for_with_url_success
    form_for_string = ::HexletCode.form_for(@user, url: 'test/usr/path')

    assert { form_for_string == '<form action="test/usr/path" method="post"></form>' }
  end
end
