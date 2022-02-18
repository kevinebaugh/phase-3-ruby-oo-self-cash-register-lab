require "pry"

class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do
      @items.push(title)
    end
    @last_item = {
      title: title,
      price: price,
      quantity: quantity
    }
  end

  def apply_discount
    if discount != 0
      @total = @total - (@total * (@discount * 0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= (@last_item[:price] * @last_item[:quantity])
  end
end
