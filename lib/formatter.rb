require 'json'

class Format

  def format_money(number)
    formatted = "$" + number.round(2).to_s
  end

  private

  def dateime
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
  end

  def format_phone_number(input)
    "+" + "(" + input[1..3] + ")" + input[4..6]+ "-" + input[7..10]
  end

  def get_order_details(order)

  end
end

# - date/time of print
# - The Coffee Connection, 123 Lakeside May
# - Phone: +1 (650) 360-0708
# - Table: 1 / [4]
# - Customer names
# - Item, quantity and price per item e.g. Coffee   1 x 4.50
# - Tax: 8.64% (put into monetary value)
# - Total
