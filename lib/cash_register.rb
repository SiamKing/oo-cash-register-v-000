
require 'pry'
class CashRegister
  attr_accessor :total, :discount, :item, :last_price


  def initialize(discount = nil)
    @total = 0
    self.discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    @last_price = total
    (1..quantity).each {|i| @items << item}
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == nil
    self.total = self.total - (self.total * (self.discount * 0.01)).floor
    return "After the discount, the total comes to $#{total}."
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    self.total -= last_price
    total
  end

end
