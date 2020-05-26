require 'rails_helper'

describe "User adds an new credit card", type: :feature, js: true do
  scenario "adds an new credit card" do
    visit('/credit_cards')
    #read these 2 websites:
    # https://github.com/teamcapybara/capybara
    # https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec

    # click the Add button
    click_link('Add')
    # fill in the credit card number
    fill_in('number', with: '67676767')
    # click the Create button
    click_button('Create')
    # check the number is added on the returned page:
    expect(page).to have_content('6767')
    expect(page).to have_css("th", text: "Card Last 4 digits")
    expect(page).to have_css("td", text: "6767")

    # 2 ths: 2 columns for the header: use all method
    # 2 tds: 2 columns for the rows
    # figure out how to check the table: for example: the header is number and type
    # and the row is 1234 and "Visa"
    # and also you only added 1 row
    # expect(page).to have_content '1234' # this is not accurate test, just for example
  end
end
