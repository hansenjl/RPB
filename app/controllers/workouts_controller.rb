class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show]

  def index
    @workouts = Workout.order_by_popularity
  end

  def show
  end

  def new
    @workout = Workout.new
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
    params.require(:workout).permit(:pace, :distance, :name, :category)
   end

   def set_workout
      @workout = Workout.find_by(id: params[:id])
      redirect_to workouts_path if !@workout
   end

end
