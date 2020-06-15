class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # if you are on a devise controller(password, registration, session), you should before any action, run the method configure_permitted_parameters

  def configure_permitted_parameters
    # sign up user info: not asking for too much infos
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date])

      # update of the user information
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :age, :city ])
  end
end
