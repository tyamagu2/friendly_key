# FriendlyKey

FriendlyKey lets you generate human friendly random strings. It generates random alphanumeric strings without letters and digits that are hard to distinguish from each other, such as I, l and 1.
You can use FriendlyKey when you need random strings that you don't want your users to copy and paste but rather enter by themselves, like  product keys and random passwords.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'friendly_key'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install friendly_key

## Usage

```ruby
# Generate a rondom string
FriendlyKey.generate # => "QNZD9H8FU5UDM848"

# Specify the length of a random string
FriendlyKey.generate(length: 8) #=> "9AFN87ES"

# Include small letters
FriendlyKey.generate(small_letters: true) # => "qK8fLq2REprjHxvG"
```

## Contributing

1. Fork it ( https://github.com/tyamagu2/friendly_key/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
