require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    vowel_swapped_text = text.swap('o', 'a')
    expected_text = <<~TEXT.chomp
    Larem ipsum dalar sit amet, cansectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse cammada sem arcu. Danec a nisi elit. Nullam eget nisi cammada, valutpat
    quam a, viverra mauris. Nunc viverra sed massa a candimentum. Suspendisse arnare justa
    nulla, sit amet mallis eras sallicitudin et. Etiam maximus malestie eras, sit amet dictum
    dalar arnare bibendum. Marbi ut massa nec larem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.\n
    TEXT

    p expected_text
    p vowel_swapped_text
    assert_equal expected_text, vowel_swapped_text
  end

  def test_word_count
    text = Text.new(@file.read)
    word_count = text.word_count

    assert_equal 72, word_count
  end

  def teardown
    @file.close
  end
end
