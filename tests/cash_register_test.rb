require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 50, current_amount
  end

  def test_change
    @transaction.amount_paid = 60

    @register.accept_money(@transaction)
    change = @register.change(@transaction)

    assert_equal 10, change 
  end

  def test_give_receipt
    @transaction.amount_paid = 50
    @register.accept_money(@transaction)
    
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end
end
