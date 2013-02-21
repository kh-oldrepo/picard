class Note < ActiveRecord::Base
  belongs_to :encounter
  attr_accessible :encounter_id, :text
end
