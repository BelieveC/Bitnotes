OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '985121775306-0mqt6gthqotu02k9jidh45u1iqtitk57.apps.googleusercontent.com', 'mQwniMEV1ZFFo_PROkaRa6ad', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :facebook, '1150516068300263', 'ecad8eadcf783c855c560a77953f4caf', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end