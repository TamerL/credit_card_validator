# frozen_string_literal: true

# to check the credit card numbers find the type and validate the digits
class CreditCard < ApplicationRecord
  # before_save :check_number_errors
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery prepend: true, with: :exception
  belongs_to :card_type
  belongs_to :user
  # add uniqueness to number
  validates :number, presence: true  # pls add database level constraints for the presence, also for the card_type

  def self.create_credit_card!(num)
    validator = CreditCardNumberValidator.new(num)
    card = CreditCard.new(number: num)
    card_type = CardType.new
    begin
      validator.validate!
      card_type.name = validator.type!
      card_type.save! unless CardType.pluck(:name).include?(card_type.name)
      # binding.pry
      card.card_type= card_type
      card.number = num[-4..-1].to_s
      # binding.pry
      card.save!
    rescue => e
      # binding.pry
      puts e.message
      card.errors.add(:base, e.message)
    end
    card
  end

  protected
  def check_number_errors
    begin
      # binding.pry
      validator = CreditCardNumberValidator.new(self.number.to_s)
      validator.valid!
      self.card_type =  validator.type
      valid = validator.valid?
      return true
    rescue => e
      # binding.pry
      puts e.message
      self.errors.add(:base, e.message)
      return false
    end
  end

  # TODO:
  # fix strong migration, also add restrictions to the column
  # uniqness(num), be present(type and num), 2 levels restrictions:
  # database level and model level

end
