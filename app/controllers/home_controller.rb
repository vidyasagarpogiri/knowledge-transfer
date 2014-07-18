class HomeController < ApplicationController

  
  #layout "home"
  layout :choose_template
  
  def choose_template
    if current_user.present?
      return "home_template"
    else
      return "home"
    end
  end

  def index
    
  end
  
end
