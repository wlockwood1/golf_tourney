class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @bets = Bet.all.order('bet_date DESC')


    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @team = Team.find(params[:id])
    @bets = @team.bets.all.order('bet_date DESC')
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @teams = Team.all
    @team = Team.create(team_params)
  end

  def update
    @teams = Team.all
    @team = Team.find(params[:id])

    @team.update_attributes(team_params)
  end


  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
       format.html { redirect_to index }
       format.json { head :no_content }
       format.js   { render :layout => false }
    end
  end

  private

    def set_team
      @team = Team.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :odds)
    end
end
