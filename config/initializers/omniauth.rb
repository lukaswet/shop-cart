Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '195033614561357', '36b4072b96900398ea3f4faeeefa54e4'
end