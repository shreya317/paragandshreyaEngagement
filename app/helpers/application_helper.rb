module ApplicationHelper
	 def countdown()
  	weddingday = Date.parse("5/8/2016")
  	today = Date.today
  	@days = (weddingday - today).to_i
  end

end
