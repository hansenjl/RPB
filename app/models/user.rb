class User < ApplicationRecord
  has_many :created_workouts, foreign_key: "user_id", class_name: "Workout"
  has_many :races
  has_many :completed_workouts, through: :races, source: :workouts
  has_many :trainings, through: :races
  has_secure_password
  validates :username, :email, presence: true
  validates :username, uniqueness: true


 def self.from_omniauth(auth)
  #there are many ways to do it
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end


end


