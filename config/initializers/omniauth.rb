Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
 # provider :facebook, '213050112074083', 'b661c121782409e1a06a8016cd775870',  {:client_options => {:ssl => {:ca_file => "#{Rails.root}/config/ca-bundle.crt"}}}
  puts("#{Rails.root}")
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end