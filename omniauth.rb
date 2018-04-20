OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '734191667701-kq6akrjn11j5rfgomjuku0vp3dbmob8r.apps.googleusercontent.com', 'v-2iW-q9xrGAFB3p3WnsmHuB', {
    provider_ignores_state: false,
    prompt: 'select_account consent',
    access_type: 'offline',
    scope: 'userinfo.email,userinfo.profile',

  }

end
