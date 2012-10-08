class Study < ActiveRecord::Base
# Need to handle case-insensitity of name uniqueness validation
  attr_accessible :description, :designer, :participants, :presentation, :researcher, :date, :name, :product_ids, :platform_ids, :findings_attributes
  has_many :findings, dependent: :destroy
  has_and_belongs_to_many :products
  has_and_belongs_to_many :platforms

  accepts_nested_attributes_for :findings, allow_destroy: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :date, presence: true
  scope :by_date, order("date DESC")
  scope :recent, limit(5).order("created_at DESC")

  define_index do
    indexes :name, :sortable => true
    indexes :id, :sortable => true
	end

end
