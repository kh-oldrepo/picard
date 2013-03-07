class Encounter < ActiveRecord::Base
  def self.search(search)
    if search
      where('name LIKE lower(?)', "%#{search}%")
    else
      scoped
    end
  end
  attr_accessible :date, :name, :tag_list, :encounter_id
  belongs_to :user
  has_many :notes
  acts_as_taggable_on :tags


end

