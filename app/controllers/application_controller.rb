class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || me_url
  end
end
