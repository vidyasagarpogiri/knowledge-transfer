module ApplicationHelper

  def format_time(date_time)
    date_time.strftime("%m/%d/%Y %I:%M%p")
  end
    
end
