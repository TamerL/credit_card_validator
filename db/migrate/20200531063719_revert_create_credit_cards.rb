require_relative '20200522055642_create_credit_cards'

class RevertCreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    revert CreateCreditCards
    create_table :credit_cards do |t|
      t.references :card_type, index:true, foreign_key:true
      t.string :number, limit: 4
      t.timestamps
    end
    add_index :credit_cards, :number, unique: true
  end
end
