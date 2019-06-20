class Race < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :workouts, through: :sessions
end
