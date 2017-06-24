OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '205094976680491', 'ed77df9892ce0843a105849505bcb7ef'
end