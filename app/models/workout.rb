class Workout < ApplicationRecord
  has_many :trainings
  has_many :races, through: :trainings
  belongs_to :user

  validates :name, :distance, presence: true

  scope :order_by_popularity, -> { Workout.left_joins(:trainings).group(:id).order("count(trainings.workout_id) desc") }
  #order by how many training sessions
end
