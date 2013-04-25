require "./app/concerns/balance_validate"

describe BalanceValidate do
  context "separate price" do
    it "when signal positive" do
      balance_validate = BalanceValidate.new "+ 10.00"
      expect(balance_validate.separate).to eql(["+", "10.00", "#008B00"])
    end

    it "when signal negative" do
      balance_validate = BalanceValidate.new "- 10.00"
      expect(balance_validate.separate).to eql(["-", "10.00", "#FF0000"])
    end

    it "when signal unsigned" do
      balance_validate = BalanceValidate.new "10.00"
      expect(balance_validate.separate).to eql(["+", "10.00", "#008B00"])
    end
  end
end
