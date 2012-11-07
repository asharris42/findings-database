class Tag < ActiveRecord::Base
  attr_accessible :description, :tag_name
  has_and_belongs_to_many :findings

  validates :tag_name, presence: true, uniqueness: { case_sensitive: false }

  scope :alphabetical, order("tag_name ASC")
end
