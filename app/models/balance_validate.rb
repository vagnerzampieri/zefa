class BalanceValidate
  def initialize price
    @price = price.values[0]
  end

  def separate
    if @price.include?('-')
      spread << '#FF0000'
    elsif @price.include?('+')
      spread << '#008B00'
    else
      ["+", @price, '#008B00']
    end
  end

  private
  def spread
    @price.split(' ')
  end
end
