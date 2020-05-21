require 'rspec/autorun'
require './src/credit_card_validator'


describe '.initialize' do
  it 'with a credit card number' do
    # pending
    card = CreditCardValidator.new("4408 0412 3456 7893")
    expect(card.num).to eq('4408041234567893')
  end
end

describe '#type' do
  context "when the credit card number has a known type" do
    it "returns Visa as a type of the credit card" do
      # pending
      card = CreditCardValidator.new("4408 0412 3456 7893")
      expect(card.type).to eq("Visa")
    end

    it "returns MasterCard as a type of the credit card" do
      # pending
      card = CreditCardValidator.new("5500 0000 0000 0004")
      expect(card.type).to eq("MasterCard")
    end

    it "returns AMEX as a type of the credit card" do
      # pending
      card = CreditCardValidator.new("3400 0000 0000 009")
      expect(card.type).to eq("AMEX")
    end

    it "returns Discover as a type of the credit card" do
      # pending
      card = CreditCardValidator.new("6011 0000 0000 0004")
      expect(card.type).to eq("Discover")
    end
  end

  context "when the credit card type is unknown" do
    it "returns Unknown" do
      # pending
      card = CreditCardValidator.new("7011 0000 0000 0004")
      expect(card.type).to eq("Unknown")
    end
  end
end

describe '#is_valid?' do
  context "when the credit card is valid" do
    it "returns true for case#1" do
      # pending
      card = CreditCardValidator.new("4111 1111 1111 1111")
      expect(card.is_valid?).to eq(true)
    end

    it "returns true for case#2" do
      # pending
      card = CreditCardValidator.new("4408 0412 3456 7893")
      expect(card.is_valid?).to eq(true)
    end
  end

  context "when the credit card is invalid" do
    it "returns false" do
      # pending
      card = CreditCardValidator.new("7011 0000 0000 0004")
      expect(card.is_valid?).to eq(false)
    end
  end
end
