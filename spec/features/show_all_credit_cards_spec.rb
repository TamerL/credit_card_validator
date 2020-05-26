require 'rails_helper'

describe "User sees all the credit cards", type: :feature, js: true do
  it "shows the credit card list" do
    CreditCard.create(number: "1234", card_type: "Visa")
    visit('/credit_cards')
    expect(page).to have_content '1234'
  end
end
