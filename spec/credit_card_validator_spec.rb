require 'rspec/autorun'
require './src/credit_card_validator'


describe '.initialize' do
  it 'has a number' do
    @card = CreditCardValidator.new("4408 0412 3456 7893")
    pending
    expect(@card.num).to eq('4408 0412 3456 7893')
  end
end

describe '#type' do
  # describe 'credit card validator integration' do
  context "when the credit card number has a known type" do
    it "returns the type of the credit card" do
      card = CreditCardValidator.new("4408 0412 3456 7893")
      pending
      expect(card.type).to eq("Visa\n")
    end

    it "returns the type of the credit card" do
      card = CreditCardValidator.new("5500 0000 0000 0004")
      pending
      expect(card.type).to eq("MasterCard\n")
    end

    it "returns the type of the credit card" do
      card = CreditCardValidator.new("3400 0000 0000 009")
      pending
      expect(card.type).to eq("AMEX\n")
    end

    it "returns the type of the credit card" do
      card = CreditCardValidator.new("6011 0000 0000 0004")
      pending
      expect(card.type).to eq("Discover\n")
    end

    context "when the credit card type is unknown" do
      it "returns an error: This card type is Unknown" do
        card = CreditCardValidator.new("7011 0000 0000 0004")
        pending
        expect do
          card.type
        end.to raise_error("This card type is Unknown")
      end
    end
  end
end

describe '#is_valid?' do
  context "when the credit card is valid" do
    it "returns Valid" do
      card = CreditCardValidator.new("4111 1111 1111 1111")
      pending
      expect(card.is_valid?).to eq("Valid\n")
    end

    context "when the credit card is invalid" do
      it "returns Invalid" do
        card = CreditCardValidator.new("7011 0000 0000 0004")
        pending
        expect do
          card.is_valid?
        end.to raise_error("This card type is Invalid")
      end
    end
  end
end
