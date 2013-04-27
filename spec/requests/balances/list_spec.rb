# encoding: UTF-8
require "spec_helper"

describe "List balance created" do
  let!(:user)             { FactoryGirl.create(:user) }
  let!(:balance_positive) { FactoryGirl.create(:balance_positive, user_id: user.id) }
  let!(:balance_negative) { FactoryGirl.create(:balance_negative, user_id: user.id) }
  let!(:balance_unsigned) { FactoryGirl.create(:balance_unsigned, user_id: user.id) }

  before do
    visit new_balance_path(user.id)
  end

  it { expect(page).to have_content(user.name) }
  it { expect(page).to have_content(balance_positive.price) }
  it { expect(page).to have_content(balance_negative.price) }
  it { expect(page).to have_content(balance_unsigned.price) }
end
