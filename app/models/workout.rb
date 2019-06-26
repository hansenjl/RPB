class Workout < ApplicationRecord
  has_many :trainings
  has_many :races, through: :trainings
  belongs_to :user

  validates :name, :distance, presence: true
end
