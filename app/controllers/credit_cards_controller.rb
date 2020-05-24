class CreditCardsController < ApplicationController

  def index
    @credit_cards = CreditCard.all
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    # binding.pry
    credit_card = CreditCard.create_credit_card!(credit_card_params[:num])
    # credit_card = credit_card.create(num: credit_card_params[:num])
    redirect_to '/'
  end

  def destroy
    # binding.pry
    CreditCard.find(params[:id]).destroy
    # redirect_to '/'
    redirect_to credit_cards_path
  end


  # strong parameters
  private
  def credit_card_params
    # binding.pry
    params.require(:credit_card).permit(:num)
  end


end
