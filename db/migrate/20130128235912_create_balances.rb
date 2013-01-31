class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :price, precision: 6, scale: 4
      t.references :user, index: true
      t.string :signal
      t.string :color

      t.timestamps
    end
  end
end
