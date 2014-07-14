class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def all
  
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if request.env["omniauth.auth"]["extra"]["raw_info"]["hd"] == "amzur.com"
      if @user.persisted?
      
        session["oauth"] = request.env["omniauth.auth"]["info"]
        flash.notice = "Signed in!"
        sign_in_and_redirect @user
      else
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
    else
      flash[:notice]= "Not an amzur mail"
      redirect_to new_user_registration_url
    end
  end
  alias_method :google_oauth2, :all
  
end
