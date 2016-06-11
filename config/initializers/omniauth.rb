Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], :scope => "email, public_profile , user_friends", :image_size => "normal", :secure_image_url => true
end