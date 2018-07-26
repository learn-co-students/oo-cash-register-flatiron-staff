require 'pry'

class CashRegister
  attr_accessor :total, :discount, :title, :last_transaction, :quantity, :items

  def initialize(discount = nil)
    @discount = discount
    @total = 0

    @items = []
  end

  def add_item(title, price, quantity=1)
    @title = title
    @quantity = quantity
    @total += (price * quantity)
    quantity.times do
      @items << title
    end
    @last_transaction = self.total
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total = (@total - (@discount*10))
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    return @items
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end


end
