class BalancesController < ApplicationController
  def new
    user
    @balances = Balance.where(user_id: user.id)
    @balance = user.balances.build
    respond_with @balances
  end

  def create
    respond_with @balance = Balance.building(params[:balance]), location: new_balance_path(user.id)
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
