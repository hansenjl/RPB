class RacesController < ApplicationController

  def index
    @races = current_user.races
  end

  def show
    @race = Race.find_by(params[:id])
  end


  def new
    @race = Race.new
  end

  def create
    @race = current_user.races.build(race_params)
    if @race.save
      redirect_to race_path(@race)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def race_params
    params.require(:race).permit(:title, :distance, :category)
  end

end
