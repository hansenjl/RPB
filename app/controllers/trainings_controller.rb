class TrainingsController < ApplicationController

  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
    @training.build_workout  #belongs_to
  end



  def create

     @training = Training.new(training_params)
     if @training.save
      redirect_to training_path(@training)
     else
      render :new
     end
  end

  private

  def training_params
    params.require(:training).permit(:date,:feeling, :race_id, :workout_id, workout_attributes:[:name, :category, :pace, :distance])
  end
end