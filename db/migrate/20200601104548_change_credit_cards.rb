class ChangeCreditCards < ActiveRecord::Migration[5.2]
  def change
      safety_assured {
        add_reference :credit_cards, :user, foreign_key: true
      }
  end
end
