# frozen_string_literal: true

class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :card_type
      t.integer :number, limit: 4
      t.timestamps
    end
  end
end
