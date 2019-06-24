class Race < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :workouts, through: :trainings
end
