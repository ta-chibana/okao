# Okao

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/okao`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'okao'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install okao

## Usage

### normal text to okao text

```
$ okao to_okao 'hi!'
(^-^)(^-^)(^-^)(´O`)(´･ω･`)(^-^)(^-^)(^-^)(^-^)(´O`)(´･ω･`)(´O`)(^-^)(^-^)(^-^)(^-^)(｡-_-｡)(´O`)
```

### okao text to normal text

```
$ okao to_text '(^-^)(^-^)(^-^)(´O`)(´･ω･`)(^-^)(^-^)(^-^)(^-^)(´O`)(´･ω･`)(´O`)(^-^)(^-^)(^-^)(^-^)(｡-_-｡)(´O`)'
hi!
```

### execute

If the result of `to_text` command is Ruby script, can be run it.

```
$ okao to_okao 'puts 1 + 1'
(^-^)(^-^)(^-^)(´O`)(-_-;)(^-^)(^-^)(^-^)(^-^)(´O`)(-_-;)(´･ω･`)(^-^)...

$ okao to_text '(^-^)(^-^)(^-^)(´O`)(-_-;)(^-^)(^-^)(^-^)(^-^)(´O`)(-_-;)(´･ω･`)(^-^)...'
2
```

### option

You can use `--file_path` option in all of okao command.

```
$ okao to_okao 'puts "result: #{(1..5).reduce(:+)}"' > sample.ok
$ okao exec --file_path sample.ok
result: 15
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/okao. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
