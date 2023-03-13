# frozen_string_literal: true

require_relative 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    user_struct = Struct.new(:name, :job, :gender, keyword_init: true)

    @user = user_struct.new(name: 'Crash Dummy', job: 'hexlet', gender: 'm')

    add_fixtures
  end

  def add_fixtures
    @fixture_with_inputs = File.read(File.expand_path('fixtures/form_for_with_inputs.html', __dir__))
    @fixture_with_text_areas = File.read(File.expand_path('fixtures/form_for_with_text_areas.html', __dir__))
    @fixture_with_submit = File.read(File.expand_path('fixtures/form_for_with_submit.html', __dir__))
    @fixture_with_custom_submit = File.read(File.expand_path('fixtures/form_for_with_custom_submit.html', __dir__))
  end

  def test_form_for_success
    form_for_html = ::HexletCode.form_for(@user)

    assert { form_for_html == '<form action="#" method="post"></form>' }
  end

  def test_form_for_with_url_success
    form_for_html = ::HexletCode.form_for(@user, url: 'test/usr/path')

    assert { form_for_html == '<form action="test/usr/path" method="post"></form>' }
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
