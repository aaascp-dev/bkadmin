OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
   '980454389877-h3tkdskm0u7hn6g9nes4v6sce2meejlm.apps.googleusercontent.com',
   'OUPSNvN5_C7bdZ70XWM5VSK_',
   {
     client_options: {
       ssl: {
         ca_file: Rails.root.join("cacert.pem").to_s
         }
      }
    }
end
