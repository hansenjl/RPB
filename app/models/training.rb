class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout


  #accepts_nested_attributes_for :workout

  def workout_attributes=(workout_params)

    workout = Workout.find_or_create_by(workout_params)
    if workout.valid?
      self.workout = workout
    end
  end


end
