class Balance < ActiveRecord::Base
  belongs_to :user

  class << self
    def building params
      balance = BalanceValidate.new params
      signal, price, color = balance.separate
      create(price: price, signal: signal, user_id: params[:user_id], color: color)
    end
  end
end
