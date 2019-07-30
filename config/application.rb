require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chat
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    #change timezome
    config.time_zone = 'Tokyo'
    
    #set local to English and Japansese
    #Make default locale to Japanese
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja

    #Looad lib folder to user cuatomer message class
    config.autoload_paths << Rails.root.join("lib")
    config.eager_load_paths << Rails.root.join("lib")
  
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
