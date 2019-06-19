class User < ApplicationRecord
  has_many :workouts
  has_many :races
  has_many :workouts, through: :races
end
