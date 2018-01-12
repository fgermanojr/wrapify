# Wrapify

Wrapify is a gem that extends the string class to add a method wrapify(wraplimit).
This gem supports wrapping text to a specified boundary, e.g. 20. The string can include multiple newlines.

Algorithm: Convert all runs of white space (spaces, tabs, new lines, carriage returns) to single spaces.
Define the runs of characters between the spaces as "words". Add words to a line until they no longer
fit (hitting the word wrap limit). Once a line is complete, add it to the final result, with a closing new line. Continue adding lines to the result until there is no more to process. The result can be a multiline string.

If a word is longer than the wraplimit, it is added to its own "long" line; this line will extend past the wordwrap limit. This is by design. One could add an option to the method to force wrap the line to avoid lines. This alternative has not been implemented.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wrapify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wrapify

## Usage

For a given string, mystring, invoke the string method, wrap_to_string, with a wraplimit.

mystring.wrap_to_string(20)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fgermanojr/wrapify.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). More generally, do whatever you want with it.
