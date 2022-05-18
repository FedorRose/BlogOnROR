require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "47498445b0921f64e60cfb294d0746037a0bba2905b3479a6710b4ad2e6d612f"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
