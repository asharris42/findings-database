class Finding < ActiveRecord::Base
  attr_accessible :content
  belongs_to :study

  validates :study_id, presence: true
  default_scope order: 'findings.id ASC'

end
