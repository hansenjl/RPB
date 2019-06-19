class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :category
      t.string :pace
      t.integer :distance

      t.timestamps
    end
  end
end
