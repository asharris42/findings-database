module SearchesHelper
	def made_choices?(form_field)
		if form_field == "Any"
			return false
		else
			return true
		end
	end
end
