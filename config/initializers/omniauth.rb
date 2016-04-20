OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1028386433903381', '37419e06295179b34d3959588d619efd', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end