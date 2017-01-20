module Grocer
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install_routes
      inject_into_file 'config/routes.rb', after: /Rails.application.routes.draw do\n/ do
        "  mount Grocer::Engine => '/'\n"\
      end
    end

    def copy_migrations
      rake 'grocer:install:migrations'
    end
  end
end
