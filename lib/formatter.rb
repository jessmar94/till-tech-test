class Format

  def format_money(number)
    formatted = "$" + number.round(2).to_s
  end

end
