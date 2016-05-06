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
	  	when "high" then " ⇧".colorize(:red) 
	  	when "medium" then " ⇨".colorize(:orange) 
	  	when "low" then " ⇩".colorize(:yellow) 
	  	when nil then ""
  	else
  		raise UdaciListErrors::InvalidPriorityValue, "#{priority}: Invalid value for priority"
  	end	
  end
end

# raise UdacityListErrors::InvalidPriorityValue, "#{priority}: Invalid Priority argument "