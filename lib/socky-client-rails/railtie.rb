require 'socky-client-rails'
require 'rails'
module Socky
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/socky-client-rails.rake"
    end
  end
end