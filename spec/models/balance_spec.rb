require 'spec_helper'

describe Balance do
  it { should belong_to(:user)}

  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:signal)}
  it { should validate_presence_of(:color)}

  describe "when create has" do
    let!(:user)             { FactoryGirl.create(:user) }
    let!(:balance_negative) { Balance.building price: '- 10.00', user_id: user.id }
    let!(:balance_positive) { Balance.building price: '+ 10.00', user_id: user.id }
    let!(:balance_unsigned) { Balance.building price: '10.00', user_id: user.id }

    it { expect(balance_positive).to be_true }

    context "price only" do
      it "balance negative" do
        expect balance_negative.price == 10.00
      end

      it "balance positive" do
        expect balance_positive.price == 10.00
      end

      it "balance unsigned" do
        expect balance_unsigned.price == 10.00
      end
    end

    it "with signal negative" do
      expect balance_negative.signal == '-'
    end

    context "with signal positive" do
      it "when balance positive" do
        expect balance_positive.signal == '+'
      end

      it "when balance unsigned" do
        expect balance_unsigned.signal == '+'
      end
    end

    it "with color red" do
      expect balance_negative.color == '#FF0000'
    end

    context "with color green" do
      it "when balance positive" do
        expect balance_positive.color == '#008B00'
      end

      it "when balance unsigned" do
        expect balance_unsigned.color == '#008B00'
      end
    end

    it "with other caracter, signal positive" do
      balance = Balance.building price: '* 10.00', user_id: user.id
      expect balance.signal == '+'
    end
  end
end
