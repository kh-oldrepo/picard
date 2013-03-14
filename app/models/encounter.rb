class Encounter < ActiveRecord::Base
  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |encounter|
        csv << encounter.attributes.values_at(*column_names)
      end
    end
  end

  attr_accessible :date, :name, :tag_list, :encounter_id
  belongs_to :user
  has_many :notes
  acts_as_taggable_on :tags


end

