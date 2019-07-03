class Race < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :workouts, through: :trainings

  validates :title, :distance, :category, presence: true
  validates :distance, numericality: { message: "%{value} must be a number" }
  #validates_uniqueness_of :title, scope: :distance

  validate :not_a_duplicate

  #Race.longest_two_races
  #@current_user.races.longest_two_races

  scope :order_alpha_reverse, -> { order(title: :desc)}
  scope :longest_two_races, -> { order(distance: :desc).limit(2)}
  scope :distance_search, -> (search_distance){ where("distance > ?", search_distance)}



  # def self.longest_three_races
  # end

  def not_a_duplicate
    #instance method
    if Race.find_by(title: title, distance: distance, category: category, user_id: user_id)
      errors.add("race", "has already been used - this race has already been created")
    end
  end
end
