# encoding: UTF-8
require "spec_helper"

describe BalancesController do
  let!(:user)     { FactoryGirl.create(:user) }
  let!(:balance)  { FactoryGirl.attributes_for(:balance_positive, user_id: user.id) }

  describe "GET new" do
    it "assigns user" do
      User.should_receive(:find).with("#{user.id}").and_return(user)
      get :new, user_id: user.id
      expect(assigns(:user)).to eql(user)
    end

    it "assigns balances" do
      Balance.should_receive(:where).with(user_id: user.id).and_return(['balance'])
      get :new, user_id: user.id
      expect(assigns(:balances)).to eql(['balance'])
    end

    it "render template new" do
      get :new, user_id: user.id
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "create a new balance" do
        expect {
          post :create, user_id: user.id, balance: balance
        }.to change(Balance, :count).by(1)
      end

      it "redirect a new balance" do
        post :create, user_id: user.id, balance: balance
        expect(response).to redirect_to(new_balance_path(user.id))
      end
    end
  end
end
