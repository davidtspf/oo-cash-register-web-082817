require 'pry'

class CashRegister

  attr_reader :discount, :title
  attr_accessor :total, :items_bought, :item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @titles = []
  end

  def add_item(title, price, quantity = 1)
    @title = title
    @item = price * quantity
    @total += price * quantity
    quantity.times do
      @titles << title
    end
  end

  def void_last_transaction
    @total -= @item
  end

  def apply_discount
    # binding.pry
    if @discount > 0
      @total = @total.to_f * ((100.0 - @discount.to_f)/100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @titles
  end

end
