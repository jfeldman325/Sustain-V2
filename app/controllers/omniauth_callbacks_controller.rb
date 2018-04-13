class OmniauthCallbacksController < Devise::OmniauthCallbacksController
def google_oauth2
  redirect_to login_path
end
end
