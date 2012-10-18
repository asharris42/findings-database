class ActivityType < ActiveRecord::Base
  attr_accessible :description, :type_name
  has_and_belongs_to_many :studies

  scope :alphabetical, order("type_name ASC")
end
