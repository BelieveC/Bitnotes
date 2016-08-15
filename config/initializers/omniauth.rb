OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '985121775306-d93srhn0iauribnri811mm6bi86211de.apps.googleusercontent.com', '7qn4dFdFJbbTt9TFDXqRUPEI', {client_options: {ssl: {ca_file: Rails.root.join("cacert.crt").to_s}}}
  provider :facebook, '490436137808844', '720a669eb670b706b6641b0f7cb6505b', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.crt").to_s}}}
end