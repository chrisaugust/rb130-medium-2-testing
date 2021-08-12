require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    input = StringIO.new('50\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 50, @transaction.amount_paid
  end
end
