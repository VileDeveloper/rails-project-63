# frozen_string_literal: true

autoload :HexletCodeVersion, File.expand_path('lib/hexlet_code/version', __dir__)

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCodeVersion::VERSION
  spec.authors = ['VileDeveloper']
  spec.email = ['vladimirlitov131127@gmail.com']

  spec.summary = 'Form_for html generator'
  spec.description = 'It is form generator like form_for default rails html generator'
  spec.homepage = 'https://github.com/VileDeveloper/rails-project-63'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/VileDeveloper/rails-project-63'
  spec.metadata['changelog_uri'] = 'https://github.com/VileDeveloper/rails-project-63'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'minitest-power_assert'
  spec.add_dependency 'rake'
  spec.add_dependency 'rubocop'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
