class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.date :bet_date
      t.integer :odds
      t.integer :amount_bet
      t.integer :payout

      t.timestamps null: false
    end
  end
end
