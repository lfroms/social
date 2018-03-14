module SearchesHelper
	def get_search_placeholder
		if defined?(@user.fullname)
			@user.fullname
		elsif defined?(@search.keywords)
			@search.keywords
		else
			"Search for people..."
		end
	end
end
