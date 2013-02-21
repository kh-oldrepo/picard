class Encounter < ActiveRecord::Base
  attr_accessible :date, :name, :tag_list, :encounter_id
  belongs_to :user
  has_many :notes
  acts_as_taggable_on :tags
end
