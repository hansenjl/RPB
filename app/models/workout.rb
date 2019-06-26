class Workout < ApplicationRecord
  has_many :trainings
  has_many :races, through: :trainings
  belongs_to :user

  accepts_nested_attributes_for :trainings, :reject_if => proc {|attributes| attributes['date'].blank?}

  validates :name, :distance, presence: true
end
