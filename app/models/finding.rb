class Finding < ActiveRecord::Base
  attr_accessible :content
  belongs_to :study
  has_and_belongs_to_many :tags

  validates :study_id, presence: true
  default_scope order: 'findings.id ASC'

  define_index do
		indexes content, :sortable => true
		indexes study.name, :as => :study_name, :sortable => true
		indexes study.products.product_name, :as => :products, :sortable => :true
    indexes study.platforms.platform_name, :as => :platforms, :sortable => :true
    indexes study.activity_types.type_name, :as => :activity_types, :sortable => true
    indexes study.date, :as => :study_date, :type => :datetime
    indexes tags.tag_name, :as => :tags, :sortable => true
	end

end
