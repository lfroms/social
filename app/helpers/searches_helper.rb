module SearchesHelper
  def search_placeholder
    if defined?(@user.fullname)
      @user.fullname
    elsif defined?(@search.keywords)
      @search.keywords
    else
      "Search for anything..."
    end
  end
end
