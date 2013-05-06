class AddAttachmentPhotoToEncounters < ActiveRecord::Migration
  def self.up
    change_table :encounters do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :encounters, :photo
  end
end
