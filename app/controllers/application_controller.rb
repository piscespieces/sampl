class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.class == Artist
      artists_sample_packs_path
    else
      sample_packs_path
    end
  end

  private

  def pundishing_user
    if current_artist
      redirect_back fallback_location: sample_packs_path, notice: "You don't have access to that route"
    else
      redirect_back fallback_location: sample_packs_path, notice: "You don't have access to that route"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
