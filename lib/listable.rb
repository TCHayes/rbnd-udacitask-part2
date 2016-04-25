module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(dates={})
  	#This method should take in either 1 or 2 dates since TodoItem requires formatting 1 date, while EventItem could have up to 2 dates
  	dates[:due] ? dates[:due].strftime("%D") : "No due date"
    dates = dates[:start_date].strftime("%D") if dates[:start_date]
    dates << " -- " + dates[:end_date].strftime("%D") if dates[:end_date]
    dates = "N/A" if !dates
    return dates
  end

#WORKING
  def format_priority
    value = " ⇧".colorize(:green) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:red) if @priority == "low"
    value = "" if !@priority
    return value
  end
end