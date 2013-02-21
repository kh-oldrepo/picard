class AddEncounterIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :encounter_id, :integer
    add_index :notes, :encounter_id
  end
end
