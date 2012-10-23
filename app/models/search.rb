class Search < ActiveRecord::Base
  attr_accessible :description, :platform, :product, :study, :tag

	def findings
    @findings ||= search_findings
	end

	private

	def search_findings
    found_findings = Finding.search "#{description}", :conditions => { :products => "#{product}" }, :per_page => 150

  	
  	found_findings
	end

end
