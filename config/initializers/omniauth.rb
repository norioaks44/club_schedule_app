# if Rails.env.production?
#   OmniAuth.config.full_host = "https://ec2-54-199-115-86.ap-northeast-1.compute.amazonaws.com"
# end

OmniAuth.config.full_host = Rails.env.production? ?'http://ec2-54-199-115-86.ap-northeast-1.compute.amazonaws.com' : 'http://localhost:3000'