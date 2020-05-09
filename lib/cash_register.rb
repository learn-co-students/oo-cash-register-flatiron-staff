require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @all_items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @all_items << title }
    self.last_transaction = price * quantity
    self.total += @last_transaction
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      discount_multiplier = @discount.to_f / 100
      @total -= @total * discount_multiplier
      @total = @total.to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
