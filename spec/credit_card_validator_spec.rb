require 'rspec/autorun'
require './src/credit_card_validator'


describe '.initialize' do
  it 'has a number' do
    pending
    card = CreditCardValidator.new("4408 0412 3456 7893")
    expect(card.num).to eq('4408 0412 3456 7893')
  end
end

describe '#type' do
  context "when the credit card number has a known type" do
    it "returns the type of the credit card" do
      pending
      card = CreditCardValidator.new("4408 0412 3456 7893")
      expect(card.type).to eq("Visa\n")
    end

    it "returns the type of the credit card" do
      pending
      card = CreditCardValidator.new("5500 0000 0000 0004")
      expect(card.type).to eq("MasterCard\n")
    end

    it "returns the type of the credit card" do
      pending
      card = CreditCardValidator.new("3400 0000 0000 009")
      expect(card.type).to eq("AMEX\n")
    end

    it "returns the type of the credit card" do
      pending
      card = CreditCardValidator.new("6011 0000 0000 0004")
      expect(card.type).to eq("Discover\n")
    end
  end

  context "when the credit card type is unknown" do
    it "returns Unknown" do
      pending
      card = CreditCardValidator.new("7011 0000 0000 0004")
      expect(card.type).to eq("Unknown\n")
    end
  end
end

describe '#is_valid?' do
  context "when the credit card is valid" do
    it "returns true" do
      pending
      card = CreditCardValidator.new("4111 1111 1111 1111")
      expect(card.is_valid?).to eq("true\n")
    end
  end

  context "when the credit card is invalid" do
    it "returns false" do
      pending
      card = CreditCardValidator.new("7011 0000 0000 0004")
      expect(card.is_valid?).to eq("false\n")
    end
  end
end
