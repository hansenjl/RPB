class Workout < ApplicationRecord
  has_many :sessions
  has_many :races, through: :sessions
  belongs_to :user
end
