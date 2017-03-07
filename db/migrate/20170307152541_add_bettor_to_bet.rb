class AddBettorToBet < ActiveRecord::Migration
  def change
    add_column :bets, :bettor, :string
  end
end
