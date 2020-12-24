# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
#   provider :identity, :fields => [:name, :email]
# end
OmniAuth.config.full_host = Rails.env.production? ? 'http://ec2-54-199-115-86.ap-northeast-1.compute.amazonaws.com/users/auth/google_oauth2/callback' : 'http://localhost:3000'