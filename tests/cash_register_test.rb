require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(500)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 50, current_amount
  end
end
