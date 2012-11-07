class ActivityType < ActiveRecord::Base
  attr_accessible :description, :type_name
  has_and_belongs_to_many :studies

  validates :type_name, presence: true, uniqueness: { case_sensitive: false }

  scope :alphabetical, order("type_name ASC")
end
