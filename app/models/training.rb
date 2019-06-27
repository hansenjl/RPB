class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout

  scope :by_workout, -> (workout_id) {where("workout_id = ?", workout_id)}

  validates :date, presence: true


  #accepts_nested_attributes_for :workout

  def workout_attributes=(workout_params)

    workout = Workout.find_or_create_by(workout_params)
    workout.valid? ? self.workout = workout : self.workout

  end


end
