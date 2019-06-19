class Session < ApplicationRecord
  belongs_to :race
  belongs_to :workout
end
