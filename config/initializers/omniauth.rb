Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    {
      redirect_uri: "http://localhost:3000/users/auth/facebook/callback",
      scope: 'public_profile',
      info_fields: 'email,first_name,last_name'
    }
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end