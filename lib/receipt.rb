require_relative 'order'
require_relative 'calculator'
require_relative 'formatter'

class Receipt

  def initialize
    @order = Order.new
    @calculator = Calculator.new
  end

  def input_order(order)
    @order_items = @order.receive_order(order)
  end

  def get_receipt
    format = Format.new
    totals = @calculator.get_tax_total(@order_items)
    items = @order_items
    customer = @order.customer
    receipt = format.format_bill(items, customer)
    return receipt
  end

end
