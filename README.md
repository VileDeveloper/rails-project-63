## Use example

Before using the gem we need to add it to Gemfile and run bundler for download all dependencies

```bash
bundle install
```

Create user object with using Struct class

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'Crash Dummy', job: 'hexlet', gender: 'm'
```

Generate html form with using next DSL:

```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :gender
  f.input :job, as: :text
  f.submit
end
=>
# <form action="#" method="post">
#   <label for="name">Crash Dummy</label>
#   <input name="name" type="text" value="Crash Dummy">
#   <label for="gender">m</label>
#   <input name="gender" type="text" value="m">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
#   <input type="submit" value="Save">
# </form>
```

Hexlet tests and linter status:  
[![Actions Status](https://github.com/VileDeveloper/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/VileDeveloper/rails-project-63/actions)  
CI tests and linter status:  
[![Actions Status](https://github.com/VileDeveloper/rails-project-63/workflows/CI/badge.svg)](https://github.com/VileDeveloper/rails-project-63/actions)  