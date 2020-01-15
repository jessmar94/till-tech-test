require_relative 'order'
require_relative 'calculator'

class Receipt

  def initialize(order = Order.new, calc = Calculator.new)
    @order = order
    @calculator = calc
  end

  def input_order(order)
    @order_items = @order.receive_order(order)
  end

  def get_receipt
    # totals = @calculator.get_tax_total(@order_items)
    # items = @order_items
    # customer = @order.customer
    # receipt = @format.format_bill(items, totals, customer)
    # return receipt
  end

end
