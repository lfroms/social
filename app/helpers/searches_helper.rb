module SearchesHelper
  def search_placeholder
    if defined?(@user.fullname)
      @user.fullname
    elsif defined?(@search.keywords)
      @search.keywords
    else
    	t('ui.search_placeholder')
    end
  end
end
