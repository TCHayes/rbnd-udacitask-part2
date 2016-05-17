module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(type, dates={})
  	#This method should take in either 1 or 2 dates since TodoItem requires formatting 1 date, while EventItem could have up to 2 dates
  	if type == "todo"
  		dates[:due] ? dates[:due].strftime("%D") : "No due date"
  	elsif type == "event"
    	formatted_dates = dates[:start_date].strftime("%D") if dates[:start_date]
    	formatted_dates << " -- " + dates[:end_date].strftime("%D") if dates[:end_date]
    	formatted_dates = "N/A" unless formatted_dates
      return formatted_dates
    end
  end

  def format_priority
    value = " ⇧".colorize(:green) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:red) if @priority == "low"
    value = "" if !@priority
    return value
  end
end