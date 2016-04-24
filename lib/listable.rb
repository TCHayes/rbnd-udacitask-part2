module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end


  def format_date(dates={})
  	#This method should take in either 1 or 2 dates since TodoItem requires formatting 1 date, while EventItem could have up to 2 dates

  end

  def format_priority
  end

end
