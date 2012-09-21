class Study < ActiveRecord::Base
# Need to handle case-insensitity of name uniqueness validation
  attr_accessible :description, :designer, :participants, :platform, :presentation, :product, :researcher, :date, :name
  has_many :findings, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :date, presence: true
  validates :product, presence: true
  validates :platform, presence: true
  default_scope order: 'studies.date DESC'

  define_index do
    indexes :name, :sortable => true
    indexes platform, :sortable => true
    indexes product, :sortable => true
    indexes :id, :sortable => true
	end
end
