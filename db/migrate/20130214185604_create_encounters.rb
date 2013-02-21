class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
