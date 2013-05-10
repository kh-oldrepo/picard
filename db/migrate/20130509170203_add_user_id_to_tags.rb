class AddUserIdToTags < ActiveRecord::Migration
  def change
    add_column :encounters, :user_id, :integer
    Encounter.update_all :user_id => 2
  end
end
