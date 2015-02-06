require 'securerandom'

# FriendlyKey lets you generate human friendly random strings. It generates random alphanumeric strings
# excluding letters and digits that are hard to distinguish from each other, such as I, l and 1.
# You can use FriendlyKey when you need random strings that you don't want your users to copy and paste
# but rather enter by themselves, such as product keys and random passwords.
module FriendlyKey
  DEFAULT_SOURCE = [(2..9), ('A'..'H'), ('J'..'N'), ('P'..'Z')].map(&:to_a).flatten.freeze
  SMALL_LETTERS = [['a'], ('c'..'k'), ['m', 'n'], ('p'..'z')].map(&:to_a).flatten.freeze
  SOURCE_WITH_SMALL_LETTERS = (DEFAULT_SOURCE + SMALL_LETTERS).freeze

  # Generates a random alphanumeric string excluding letters that are hard for human to distinguish from each otehr.
  # More specifically, it returns a random string composed of alphabets and digits excluding
  # 0 (digit zero), 1 (digit one), I (capital letter I), O (capital letter O), b (small letter b), l (small letter l) and o (small letter o).
  # @option options [Integer] :length length of the string to be generated. Default is 16
  # @option options [Boolean] :small_letters Include small letters if true. Default is false
  # @return [String] random string of given length
  def self.generate(options = {})
    options = { length: 16, small_letters: false }.merge(options)

    source = options[:small_letters] ? SOURCE_WITH_SMALL_LETTERS : DEFAULT_SOURCE
    options[:length].times.map { source[SecureRandom.random_number(source.length)] }.join
  end
end
