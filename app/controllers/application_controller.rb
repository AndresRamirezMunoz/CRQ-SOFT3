class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = %i[name adress phone email password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)

    # devise_parameter_sanitizer.permit(:sign_up,
    #                                   keys: %i[name adress phone email password password_confirmation])

    # devise_parameter_sanitizer.for(:account_update).push(:name, :adress, :email, :phone)
  end
end
