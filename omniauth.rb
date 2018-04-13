OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '708537423624-jtoliutrn3pav4qarn98i99s8jnqrmse.apps.googleusercontent.com', 'Zsclyjb9Vqr7cKL0Ix1k_uWF', {
    provider_ignores_state: true,
    prompt: 'select_account consent',
    access_type: 'offline',
    scope: 'userinfo.email,userinfo.profile'
  }

end
