# Setup our omniauth middleware
# Move this file to config/initializers/omniauth.rb
#
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :github , 'REPLACE_WITH_YOUR_CLIENT_ID' , 'REPLACE_WITH_YOUR_CLIENT_SECRET'
end

