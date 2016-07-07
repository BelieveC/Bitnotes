OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '985121775306-0mqt6gthqotu02k9jidh45u1iqtitk57.apps.googleusercontent.com', 'mQwniMEV1ZFFo_PROkaRa6ad', {client_options: {ssl: {ca_file: Rails.root.join("cacert.crt").to_s}}}
  provider :facebook, '1150506491634554', 'f835fbfdd13a0c669c3ee96dea03c97a', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.crt").to_s}}}
end