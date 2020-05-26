class AddIndexToCreditCardNumber < ActiveRecord::Migration[5.2]
  def change
    add_index :credit_cards, :number, unique: true
  end
end
