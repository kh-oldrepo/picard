class AddUserIdToEncounters < ActiveRecord::Migration

  def up
    add_column :encounters, :user_id, :integer
    Encounter.update_all :user_id => 2
  end

  def down
    remove_column  :encounters, :user_id
  end

end
