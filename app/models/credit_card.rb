# frozen_string_literal: true

# to check the credit card numbers find the type and validate the digits
class CreditCard < ApplicationRecord
  # add uniqueness to number
  def self.create_credit_card!(num)
    # validator = CreditCardValidator.new(params[:num])
    # type =  validator.type
    # is_valid? = validator.is_valid?
    # # store the errors to the errors of the model
    # # only store valid record to the database:
    # if is_valid?
      self.create!(number: num[-4..-1])
    # end

  end

  # TODO:
  # fix strong migration, also add restrictions to the column
  # uniqness(num), be present(type and num), 2 levels restrictions:
  # database level and model level

end
