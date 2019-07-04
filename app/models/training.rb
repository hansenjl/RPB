class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout

  scope :by_workout, -> (workout_id) {where("workout_id = ?", workout_id)}

  validates :date, presence: true
  validates_associated :workout


  #accepts_nested_attributes_for :workout

  def workout_attributes=(workout_params)
    workout = Workout.find_or_create_by(workout_params)
    #workout.valid? ? self.workout = workout : self.workout
    workout_params[:name].empty? ? self.workout : self.workout = workout
  end

  def datetime
    self.date.strftime("%A, %b %d") if self.date
    #self.date.try(:strftime, "%A, %b %d")
  end

  def username
    @username ||= self.race.try(:user).try(:username)
  end

end
