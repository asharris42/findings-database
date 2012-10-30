class Study < ActiveRecord::Base
# Need to handle case-insensitity of name uniqueness validation
  attr_accessible :description, :designer, :participants, :presentation, :researcher, :date, :name, :product_ids, :platform_ids, :activity_type_ids, :findings_attributes
  has_many :findings, dependent: :destroy
  has_and_belongs_to_many :products
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :activity_types
  mount_uploader :presentation, PresentationUploader

  accepts_nested_attributes_for :findings, allow_destroy: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :date, presence: true
  scope :by_date, order("date DESC")
  scope :recent, limit(5).order("created_at DESC")
  scope :alphabetical, order("name ASC")

  define_index do
    indexes :name, :as => :study_name, :sortable => true
    indexes products.product_name, :as => :products, :sortable => :true
    indexes platforms.platform_name, :as => :platforms, :sortable => :true
    indexes findings.content, :as => :findings, :sortable => :true
    indexes activity_types.type_name, :as => :activity_types, :sortable => true
	end

end
