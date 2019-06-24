class RacesController < ApplicationController

  def index
    @races = current_user.races
  end

  def show
    @race = Race.find_by(id: params[:id])
  end


  def new
    @race = Race.new
  end

  def create
    @race = current_user.races.build(race_params)
    byebug
    if @race.save
      redirect_to race_path(@race)
    else
      render :new
    end
  end

  def edit
    @race = Race.find_by(id: params[:id])
  end

  def update
    @race = Race.find_by(id: params[:id])
    if @race.update(race_params)
      redirect_to race_path(@race)
    else
      render :edit
    end
  end

  private

  def race_params
    params.require(:race).permit(:title, :distance, :category)
  end

end
