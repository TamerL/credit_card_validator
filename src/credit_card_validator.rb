# frozen_string_literal: true

require 'pry'
# to check the credit card numbers find the type and validate the digits
class CreditCardValidator
  attr_reader :num
  def initialize(num)
    @num = num.gsub(' ', '')
  end

  def valid?
    validate!
    array = num.to_s.split('').map(&:to_i)
    iterator = array.length - 2
    while iterator >= 0
      array[iterator] *= 2
      iterator -= 2
    end
    sum = array.join.split('').sum(&:to_i)
    (sum % 10).zero?
  end

  def type
    validate!
    visa? || master? || amex? || discover? || 'Unknown'
  end

  private

  # this is small check method that would be called in the type() valid?()
  # if it s bigger then few lines - causing performance issues - it should
  # be public and let the third party - outside the class - call it before init.
  def validate!
    raise 'Credit card number should contain only numbers' unless
    num.scan(/\D/).empty?
    raise 'Credit card number length should be between 13 and 16 digits' if
    num.length > 16 || num.length < 13
  end

  def visa?
    [13, 16].include?(num.length) && num[0] == '4' ? 'Visa' : nil
  end

  def master?
    num.length == 16 && num[0] == '5' && (1..5).map(&:to_s).include?(num[1]) ? 'MasterCard' : nil
  end

  def amex?
    (num.length == 15) && (num[0..1] == '34' || num[0..1] == '37') ? 'AMEX' : nil
  end

  def discover?
    num.length == 16 && num[0..3] == '6011' ? 'Discover' : nil
  end
end
