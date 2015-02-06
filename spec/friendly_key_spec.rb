require 'spec_helper'

RSpec.describe FriendlyKey do
  describe '.DEFAULT_SOURCE' do
    let(:expected_source) { [2, 3, 4, 5, 6, 7, 8, 9, *%w(A B C D E F G H J K L M N P Q R S T U V W X Y Z)] }
    subject { FriendlyKey::DEFAULT_SOURCE }

    it 'contains numbers and capital letters excluding 0, 1, I and O' do
      is_expected.to match_array(expected_source)
    end
  end

  describe '.SOURCE_WITH_SMALL_LETTERS' do
    let(:expected_source) { [2, 3, 4, 5, 6, 7, 8, 9, *%w(A B C D E F G H J K L M N P Q R S T U V W X Y Z a c d e f g h i j k m n p q r s t u v w x y z)] }
    subject { FriendlyKey::SOURCE_WITH_SMALL_LETTERS }

    it 'contains numbers and capital letters excluding 0, 1, I, O, b, l and o' do
      is_expected.to match_array(expected_source)
    end
  end

  describe '.generate' do
    let(:length) { 10000 }
    let(:another_key) { FriendlyKey.generate(length: length, small_letters: small_letters) }
    subject { FriendlyKey.generate(length: length, small_letters: small_letters) }

    context 'without small letters' do
      let(:small_letters) { false }
      let(:expected_regexp) { Regexp.new("\\A[2-9A-HJ-NP-Z]{#{length}}\\z") }

      it 'generates a random string of given length without 0, 1, I and O' do
        is_expected.to match(expected_regexp)
      end

      # Theoretically, this example could fail. Pratcically, we can ignore that possibility.
      it 'generates a different string every time' do
        is_expected.not_to eq another_key
      end
    end

    context 'with small letters' do
      let(:small_letters) { true }
      let(:expected_regexp) { Regexp.new("\\A[2-9A-HJ-NP-Zac-kmnp-z]{#{length}}\\z") }

      it 'generates a random string of given length without 0, 1, I, O, b, l and o' do
        is_expected.to match(expected_regexp)
      end

      # Theoretically, this example could fail. Pratcically, we can ignore that possibility.
      it 'contains small letters' do
        is_expected.to match(/[a-z]/)
      end

      # Theoretically, this example could fail. Pratcically, we can ignore that possibility.
      it 'generates a different string every time' do
        is_expected.not_to eq another_key
      end
    end
  end
end
