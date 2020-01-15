require 'json'

class Format

  attr_reader :bill

  def initialize
    @bill = ""
  end

  def format_money(number)
    formatted = "$" + number.round(2).to_s
  end

  def format_bill(order)
    get_cafe_details
    customer_name(order)
    items = order[@customer]
    format_order_details(items)
    @bill = "#{datetime}
    #{@shop}
    #{@address}
    #{@phone}
    #{@customer}
    #{@order}
    tax
    total
    "
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
      @order << item + " " + quantity.to_s + " x " + @prices[item].to_s + "\n"
    end
    return @order.chomp("\n")
  end

  def format_tax_total(input)
    puts "Tax: " + input["Tax"]
    puts "Total: " + input["Total"]
  end

  def customer_name(input)
    name = input.keys
    @customer = name[0]
  end

end
