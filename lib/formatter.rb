require 'json'
require_relative 'calculator'

class Format

  def initialize
    @bill = ""
  end

  def format_money(number)
    formatted = "$" + number.round(2).to_s
  end

  def format_bill(order, customer)
    get_cafe_details
    format_order_details(order)
    format_tax_total(order)
    @bill = "#{datetime}\n#{@shop}\n#{@address}\n#{@phone}\n#{customer}\n#{@order}Tax: #{@tax}\nTotal: #{@total}"
  end

  private

  def datetime
    Time.now.strftime("%d/%m/%Y %H:%M")
  end

  def get_cafe_details
    file = open("coffee.json")
    json = file.read
    parse = JSON.parse(json)
    @shop = parse[0]['shopName']
    @address = parse[0]['address']
    number = parse[0]['phone']
    @phone = format_phone_number(number)
    @prices = parse[0]['prices'][0]
  end

  def format_phone_number(input)
    "+" + input[0] + " (" + input[1..3] + ") " + input[4..6]+ "-" + input[7..10]
  end

  def format_order_details(items)
    @order = ""
    items.each do |item, quantity|
      @order << item + " " + quantity.to_s + " x " + ("%.2f" % @prices[item].to_s) + "\n"
    end
  end

  def format_tax_total(order)
    calc = Calculator.new
    amounts = calc.get_tax_total(order)
    @total = amounts["Total"]
    @tax = amounts["Tax"]
  end

end
