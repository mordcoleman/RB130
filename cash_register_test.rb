require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(10)
    transaction = Transaction.new(5)
    transaction.amount_paid = 5

    orginal_amount = register.total_money
    register.accept_money(transaction)
    final_amount = register.total_money

    assert_equal((orginal_amount + 5), final_amount)
  end

  def test_change
    register = CashRegister.new(10)
    transaction = Transaction.new(5)
    transaction.amount_paid = 10

    change = register.change(transaction)

    assert_equal(5, change)
  end

  def test_give_receipt
    item_cost = 5
    register = CashRegister.new(10)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n"){register.give_receipt(transaction)}
  end

  def test_prompt_for_payment
    transaction = Transaction.new(5)
    input = StringIO.new("5")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(5, transaction.amount_paid)
  end
end

