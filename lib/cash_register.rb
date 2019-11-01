class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(item, price, qty = 1)
    qty.times do 
      @items << item
      @transactions << price
    end
    
    @total += price * qty
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0

    @total = (100 - @discount) * 0.01 * @total
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transactions.last
  end
end
