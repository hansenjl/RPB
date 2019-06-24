class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.datetime :date
      t.string :feeling
      t.belongs_to :race, foreign_key: true
      t.belongs_to :workout, foreign_key: true

      t.timestamps
    end
  end
end
