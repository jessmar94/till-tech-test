class Order

  attr_reader :output, :customer

  def initialize
    @output = Hash.new(0)
    @customer = ""
  end

  def get_customer(input)
    array = input.tr("\n",", ").split(",")
    customer << array[0]
    @customer = customer
  end

  def receive_order(input)
    items = get_orders(input)
    name = get_customer(input)
    return items[name]
  end

  private

  def get_orders(input)
    array = input.tr("\n",", ").split(",")
    internal_hash = get_internal_hash(input)
    @output[array[0]] = internal_hash
    return @output
  end

  def get_internal_hash(input)
    internal_hash = Hash.new(0)
    array = input.tr("\n",", ").split(",")
    orders_array = array.drop(1)
    orders_array.each do |item|
      internal_hash[item[4..(item.length)]] = item[0].to_i
    end
    return internal_hash
  end
end
