class User < ApplicationRecord
  has_many :credit_cards, dependent: :destroy
end
