OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '31784258058-vbo1utcvlanmov42ocu49m91tgdjb18s.apps.googleusercontent.com', 'ONtJ8NLrYKDwmDS06S9dlDTo', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end