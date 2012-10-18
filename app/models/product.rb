class Product < ActiveRecord::Base
  attr_accessible :description, :product_name
  has_and_belongs_to_many :studies

  scope :alphabetical, order("product_name ASC")
end
