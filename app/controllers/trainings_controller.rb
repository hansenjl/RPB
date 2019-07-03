class TrainingsController < ApplicationController

  def show
    @training = Training.find(params[:id])
  end

  def index
    #if it's nested
    if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
      @trainings = @workout.trainings
      # @trainings = current_user.trainings.by_workout(params[:workout_id])
        #load up only the trainings nested under that workout
    elsif params[:race_id] && @race = Race.find_by_id(params[:race_id])
      @trainings = @race.trainings
    else
      #keep with the same old stuff
      @trainings = Training.all
    end
  end

  def new
    if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
      @training = @workout.trainings.build #has_many
    else
      @training = Training.new
      @training.build_workout  #belongs_to - nested form
    end
  end

  def create
     if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
      @training = @workout.trainings.build(training_params)
     else
      @training = Training.new(training_params)
     end

     if @training.save
      redirect_to training_path(@training)
     else
      render :new
     end
  end

  private

  def training_params
    params.require(:training).permit(:date,:feeling, :race_id, :workout_id, workout_attributes:[:name, :category, :pace, :distance, :user_id])
  end
end