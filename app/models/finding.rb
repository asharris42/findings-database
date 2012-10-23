class Finding < ActiveRecord::Base
  attr_accessible :content
  belongs_to :study

  validates :study_id, presence: true
  default_scope order: 'findings.id ASC'

  define_index do
		indexes content, :sortable => true
		indexes study.name, :as => :study_name, :sortable => true
		indexes study.products.product_name, :as => :products, :sortable => :true
    indexes study.platforms.platform_name, :as => :platforms, :sortable => :true
    indexes study.activity_types.type_name, :as => :activity_types, :sortable => true
	end

end
