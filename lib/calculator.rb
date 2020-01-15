require_relative 'order'
require_relative 'formatter'
require 'json'

class Calculator

  def initialize
    @payment = {"Tax" => "$0", "Total" => "£0"}
    @order = Order.new
    @format = Format.new
    @total = 0
    @tax = 0
  end

  def order(input)
    get_order(input)
    get_customer(input)
  end

  def final_bill
    total_amnt = calc_total
    tax_amnt = calc_tax
    # @payment["Tax"] = "$" + tax_amnt.round(2).to_s
    @payment["Tax"] = @format.format_money(tax_amnt)
    # @payment["Total"] = "$" + total_amnt.round(2).to_s
    @payment["Total"] = @format.format_money(total_amnt)
    return @payment
  end

  private

  def calc_total
    prices = get_prices
    items = @final_order[@customer[0]]
    items.each do |item, quantity|
      @total += (prices[item] * quantity)
    end
    return @total
  end

  def calc_tax
    @tax = @total * 0.0864
  end

  def get_prices
    file = open("coffee.json")
    json = file.read
    parse = JSON.parse(json)
    parse[0]['prices'][0]
  end

  def get_order(input)
    @final_order = @order.receive_order(input)
  end

  def get_customer(input)
    @customer = @order.get_customer(input)
  end

end
