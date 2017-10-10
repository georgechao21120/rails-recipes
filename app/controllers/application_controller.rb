class ApplicationController < ActionController::Base

  before_action :set_timezone
  before_action :set_locale
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

    def set_timezone
      if current_user && current_user.time_zone
        Time.zone = current_user.time_zone
      end
    end

   def set_locale
     if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
       session[:locale] = params[:locale]
     end

     I18n.locale = session[:locale] || I18n.default_locale
   end

end
