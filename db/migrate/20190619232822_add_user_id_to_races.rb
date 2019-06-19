class AddUserIdToRaces < ActiveRecord::Migration[5.2]
  def change
    add_column :races, :user_id, :integer 
  end
end
