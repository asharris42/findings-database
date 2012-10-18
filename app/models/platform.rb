class Platform < ActiveRecord::Base
  attr_accessible :description, :platform_name
  has_and_belongs_to_many :studies

  scope :alphabetical, order("platform_name ASC")
end
