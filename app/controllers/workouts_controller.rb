class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
    @workout.trainings.build
    @workout.trainings.build
  end

  def create
     @workout = current_user.created_workouts.build(workout_params)
     if @workout.save
      redirect_to workout_path(@workout)
     else
      render :new
     end
  end

   private

   def workout_params
    params.require(:workout).permit(:pace, :distance, :name, :category, trainings_attributes:[:date,:race_id,:feeling])
   end
end
