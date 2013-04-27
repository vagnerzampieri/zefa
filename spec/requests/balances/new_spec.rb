# encoding: UTF-8
require "spec_helper"

describe "Balance new" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit new_balance_path(user.id)
  end

  context "with valid attributes" do
    before do
      fill_in "balance_price", with: "+ 1000.0000"
      click_on "Criar"
    end

    it "redirect to new" do
      expect(current_path).to eql(new_balance_path(user.id))
    end

    it { expect(page).to have_content("1000.0") }
  end
end
