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
    @transaction.prompt_for_payment(input: input)
    assert_equal 50, @transaction.amount_paid
  end
end
