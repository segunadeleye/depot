class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :time
  before_action :authorize
  before_action :set_i18n_locale_from_params

  def time
    @time = Time.now.strftime('%a %b %e, %Y %T')
  end

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in."
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash[:notice] = "#{params[:locale]} translation not available"
          logger.error flash[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
