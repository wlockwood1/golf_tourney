json.extract! bet, :id, :date, :bet_id, :odds, :amount_bet, :payout, :created_at, :updated_at
json.url bet_url(bet, format: :json)
