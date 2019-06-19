class Race < ApplicationRecord
  has_many :sessions
  has_many :workouts, through: :sessions
end
