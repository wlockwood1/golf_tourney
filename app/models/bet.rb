class Bet < ActiveRecord::Base
  belongs_to :team
  # before_save :get_team_odds
  before_save :calculate_payout
end

def formatted_name
  if odds > 0
    "#{name}: +#{odds}"
  else
    "#{name}:  #{odds}"
  end
end

def more_than_zero?
  self.odds > 0
end
# def get_team_odds
#   self.odds = self.team.odds
# end

def calculate_payout
  unless self.amount_bet.blank?
    if self.odds < 0
      self.payout = (((100.to_f/(-1 * self.odds)) * (self.amount_bet)).to_int)+self.amount_bet
    elsif self.odds > 0
      self.payout = (((self.odds/100.to_f) * (self.amount_bet)).to_int)+self.amount_bet
    end
  end
end
