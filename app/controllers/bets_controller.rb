class BetsController < ApplicationController
  def index
    @bets = Bet.all


    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

  def new
    @bet = Bet.new
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def create
    @bets = Bet.all
    @bet = Bet.create(bet_params)
  end

  def update
    @bets = Bet.all
    @bet = Bet.find(params[:id])

    @bet.update_attributes(bet_params)
  end


  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy

    respond_to do |format|
       format.html { redirect_to index }
       format.json { head :no_content }
       format.js   { render :layout => false }
    end
  end

  private

    def set_bet
      @bet = Bet.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:team_id, :bet_date, :bettor, :odds, :amount_bet, :payout)
    end
end
