class CreditCardValidator
  attr_accessor :num
  def initialize(num)
    @num = num
    check_num(@num)
  end

  def type
    case num
    when -> (num) {[13,16].include?(num.length) && num[0] == "4"}
      then
      return "Visa"
    when -> (num) {num.length == 16 && num[0] == "5" &&
      (1..5).map(&:to_s).include?(num[1])}
      then
      return "MasterCard"
    when -> (num) {num.length == 15 && (num[0..1] == "34" || num[0..1] == "37")}
      then
      return "AMEX"
    when -> (num) {num.length == 16 && num[0..3] == "6011"}
      then
      return "Discover"
    else
      return "Unknown"
    end
  end

  def is_valid?
    array = num.to_s.split('').map(&:to_i)
    iterator = array.length - 2
    while iterator >= 0 do
      array[iterator] *= 2
      iterator -= 2
    end
    sum = array.join.to_s.split('').map(&:to_i).sum
    if sum % 10 == 0
      return true
    else
      return false
    end
  end

  private
  def check_num(num)
    raise "Credit card number should contain only numbers" if @num.scan(/\D/).empty?
    @num = num.gsub(' ','')
  end
end
