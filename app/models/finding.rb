class Finding < ActiveRecord::Base
  attr_accessible :content
  belongs_to :study

  validates :study_id, presence: true
  default_scope order: 'findings.id ASC'

  define_index do
    indexes content, :sortable => true
    indexes study_id, :sortable => true
	end

end
