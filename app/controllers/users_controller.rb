class UsersController < ApplicationController

  def index
    # @credit_cards = CreditCard.includes(:user)
    # @users = User.eager_load(:credit_cards)
    @users = User.eager_load(credit_cards: :card_type)
    #Pizzahut= Company.eager_load(users: [credit_cards: :card_type])
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.create!(user_params[:name])
    if @credit_card.errors.empty?
      flash.notice = "User was created successfully."
      redirect_to '/'
    end
  end

  def destroy
    binding.pry
    CreditCard.find(params[:id]).destroy
    redirect_to users_path
  end


  # strong parameters
  private
  def user_params
    # binding.pry
    params.require(:user).permit(:name)
  end
end
