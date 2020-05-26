# frozen_string_literal: true
require 'rails_helper'
require './app/models/credit_card_number_validator.rb'

RSpec.describe CreditCardNumberValidator do
  describe '.initialize' do
    it 'with a credit card number' do
      card = CreditCardNumberValidator.new('4408 0412 3456 7893')
      expect(card.num).to eq('4408041234567893')
    end
  end

  describe '#type' do
    context 'when the credit card number contains characters' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408a41234567893')
        expect do
          card.type
        end.to raise_error('Credit card number should contain only numbers')
      end
    end

    context 'when the credit card number length is shorter than 13' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408')
        expect do
          card.type
        end.to raise_error('Credit card number length should be between 13 and 16 digits')
      end
    end

    context 'when the credit card number length is longer than 16' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408 0000 3333 4444 5555 6')
        expect do
          card.type
        end.to raise_error('Credit card number length should be between 13 and 16 digits')
      end
    end

    context 'when the credit card number has a known type' do
      it 'returns Visa as a type of the credit card' do
        card = CreditCardNumberValidator.new('4408 0412 3456 7893')
        expect(card.type).to eq('Visa')
      end

      it 'returns MasterCard as a type of the credit card' do
        card = CreditCardNumberValidator.new('5500 0000 0000 0004')
        expect(card.type).to eq('MasterCard')
      end

      it 'returns AMEX as a type of the credit card' do
        card = CreditCardNumberValidator.new('3400 0000 0000 009')
        expect(card.type).to eq('AMEX')
      end

      it 'returns Discover as a type of the credit card' do
        card = CreditCardNumberValidator.new('6011 0000 0000 0004')
        expect(card.type).to eq('Discover')
      end
    end

    context 'when the credit card type is unknown' do
      it 'returns Unknown' do
        card = CreditCardNumberValidator.new('7011 0000 0000 0004')
        expect(card.type).to eq('Unknown')
      end
    end
  end

  describe '#valid?' do
    context 'when the credit card number contains characters' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408a41234567893')
        expect do
          card.valid?
        end.to raise_error('Credit card number should contain only numbers')
      end
    end

    context 'when the credit card number length is shorter than 13' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408')
        expect do
          card.valid?
        end.to raise_error('Credit card number length should be between 13 and 16 digits')
      end
    end

    context 'when the credit card number length is longer than 16' do
      it 'raise an error' do
        card = CreditCardNumberValidator.new('4408 0000 3333 4444 5555 6')
        expect do
          card.valid?
        end.to raise_error('Credit card number length should be between 13 and 16 digits')
      end
    end

    context 'when the credit card is valid' do
      it 'returns true for case#1' do
        card = CreditCardNumberValidator.new('4111 1111 1111 1111')
        expect(card.valid?).to eq(true)
      end

      it 'returns true for case#2' do
        card = CreditCardNumberValidator.new('4408 0412 3456 7893')
        expect(card.valid?).to eq(true)
      end
    end

    context 'when the credit card is invalid' do
      it 'returns false' do
        card = CreditCardNumberValidator.new('7011 0000 0000 0004')
        expect(card.valid?).to eq(false)
      end
    end
  end
end
