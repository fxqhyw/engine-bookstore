class ApplicationController < ActionController::Base
  helper_method :current_order

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end
