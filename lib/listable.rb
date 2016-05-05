module Listable
  # Listable methods go here
  def format_description(description)
	"#{description}".ljust(30)  	
  end
  def format_date(start_date, end_date)
  	dates = start_date.strftime("%D") if start_date
    dates << " -- " + end_date.strftime("%D") if end_date
    dates = "N/A dates" if !dates
    return dates
  end
  def format_priority(priority)
  	case priority
	  	when "high" then " ⇧"
	  	when "medium" then " ⇨" 
	  	when "low" then " ⇩"
  	else
  		""
  	end	
  end
end
