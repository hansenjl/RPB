class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :title
      t.string :category
      t.integer :distance
      t.string :description

      t.timestamps
    end
  end
end
