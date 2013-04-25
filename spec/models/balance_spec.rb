require 'spec_helper'

describe Balance do
  it { should belong_to(:user)}

  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:signal)}
  it { should validate_presence_of(:color)}

  context "when create has" do
    before do
      @user = FactoryGirl.create(:user)

      @balance_negative = Balance.building price: '- 10.00', user_id: @user.id
      @balance_positive = Balance.building price: '+ 10.00', user_id: @user.id
      @balance_unsigned = Balance.building price: '10.00', user_id: @user.id
    end

    it "pass" do
      expect(@balance_positive).to be_true
    end

    it "price only" do
      expect @balance_negative.price == 10.00
      expect @balance_positive.price == 10.00
      expect @balance_unsigned.price == 10.00
    end

    it "with signal negative" do
      expect @balance_negative.signal == '-'
    end

    it "with signal positive" do
      expect @balance_positive.signal == '+'
      expect @balance_unsigned.signal == '+'
    end

    it "with color red" do
      expect @balance_negative.color == '#FF0000'
    end

    it "with color green" do
      expect @balance_positive.color == '#008B00'
      expect @balance_unsigned.color == '#008B00'
    end

    it "with other caracter, signal positive" do
      balance = Balance.building price: '* 10.00', user_id: @user.id
      expect balance.signal == '+'
    end
  end
end
