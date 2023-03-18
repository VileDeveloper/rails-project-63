# frozen_string_literal: true

Dir[File.expand_path('../lib/**/*.rb', __dir__)].each { |file| require file }

require 'minitest/autorun'
require 'minitest/power_assert'

def read_fixture(filename)
  File.read(File.expand_path("fixtures/#{filename}", __dir__))
end
