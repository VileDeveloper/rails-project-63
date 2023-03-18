# frozen_string_literal: true

require_relative '../test_helper'

module HexletCode
  class TagBuilderTest < Minitest::Test
    def test_build_unpaired_tag_success
      tag_string = TagBuilder.build('br')

      assert { tag_string == '<br>' }
    end

    def test_build_paired_tag_success
      tag_string = TagBuilder.build('label')

      assert { tag_string == '<label></label>' }
    end

    def test_build_tag_with_body_success
      tag_string = TagBuilder.build('label') { 'Body text' }

      assert { tag_string == '<label>Body text</label>' }
    end

    def test_build_tag_with_attributes_success
      tag_string = TagBuilder.build('img', src: 'assets/images/path', for: 'email')

      assert { tag_string == '<img src="assets/images/path" for="email">' }
    end

    def test_build_unknown_tag_exception
      exception = assert_raises(Exception) { TagBuilder.build('unknown_tag') }

      assert_equal('Unknown tag!', exception.message)
    end
  end
end
