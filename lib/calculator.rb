require_relative 'formatter'
require 'json'

class Calculator

  def initialize
    @payment = {"Tax" => "$0", "Total" => "£0"}
    @total = 0
    @tax = 0
  end

  def get_tax_total(order)
    total = calc_total(order)
    total_amnt = total
    tax_amnt = calc_tax
    format = Format.new
    @payment["Tax"] = format.format_money(tax_amnt)
    @payment["Total"] = format.format_money(total_amnt)
    return @payment
  end

  private

  def calc_total(order)
    prices = get_prices
    order.each do |item, quantity|
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

end
