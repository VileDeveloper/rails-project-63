# frozen_string_literal: true

require_relative 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    user_struct = Struct.new(:name, :job, :gender, keyword_init: true)

    @user = user_struct.new(name: 'Crash Dummy', job: 'hexlet', gender: 'm')

    add_fixtures
  end

  def add_fixtures
    @fixture_form_default_values = read_fixture('fixture_form_default_values.html')
    @fixture_form_with_url = read_fixture('fixture_form_with_url.html')
    @fixture_with_inputs = read_fixture('form_with_inputs.html')
    @fixture_with_text_areas = read_fixture('form_with_text_areas.html')
    @fixture_with_submit = read_fixture('form_with_submit.html')
    @fixture_with_custom_submit = read_fixture('form_with_custom_submit.html')
  end

  def test_form_for_success
    form_for_html = ::HexletCode.form_for(@user)

    assert { form_for_html == @fixture_form_default_values }
  end

  def test_form_for_with_url_success
    form_for_html = ::HexletCode.form_for(@user, url: 'test/usr/path')

    assert { form_for_html == @fixture_form_with_url }
  end

  def test_form_for_with_inputs_success
    form_for_html =
      ::HexletCode.form_for(@user) do |f|
        f.input :name, class: 'user-input'
        f.input :job
      end

    assert { form_for_html == @fixture_with_inputs }
  end

  def test_form_for_with_text_areas_success
    form_for_html =
      ::HexletCode.form_for(@user) do |f|
        f.input :job, as: :text, rows: 50, cols: 50
        f.input :name, as: :text
      end

    assert { form_for_html == @fixture_with_text_areas }
  end

  def test_form_for_with_submit_success
    form_for_html =
      ::HexletCode.form_for(@user) do |f|
        f.input :job, as: :text, rows: 50, cols: 50
        f.input :name, as: :text
        f.submit
      end

    assert { form_for_html == @fixture_with_submit }
  end

  def test_form_for_with_custom_submit_success
    form_for_html =
      ::HexletCode.form_for(@user) do |f|
        f.input :job, as: :text, rows: 50, cols: 50
        f.input :name, as: :text
        f.submit 'Custom save'
      end

    assert { form_for_html == @fixture_with_custom_submit }
  end
end
