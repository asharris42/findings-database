class Search < ActiveRecord::Base
  attr_accessible :description, :platform, :product, :study, :tag

	def findings
    @findings ||= search_findings
	end

	private

	def search_findings
  	found_studies = Study.order(:date)
  	found_studies = found_studies.where("name like ?", "%#{study}%")
    found_studies = found_studies.includes(:products).where("products.product_name = ?", "#{product}") unless product.empty?
    found_studies = found_studies.includes(:platforms).where("platforms.platform_name = ?", "#{platform}") unless platform.empty?
  	
  	found_study_ids = found_studies.each do |study|
  		study.id
  	end

  	found_findings = Finding.where(:study_id => found_study_ids).
      where("content like ?", "%#{description}%").find(:all, :order => "study_id ASC")
		
  	found_findings
	end

end
