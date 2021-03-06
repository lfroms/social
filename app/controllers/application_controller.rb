class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  protected

  def configure_permitted_parameters
    attributes = [:fullname, :email, :profile_photo, :cover_photo, :locale]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    :feed
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_locale
    user_locale = I18n.locale = current_user.locale if user_signed_in?
    I18n.locale = params[:locale] || user_locale || I18n.default_locale
  end
end
