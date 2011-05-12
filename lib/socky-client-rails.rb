require 'rails'
require 'yaml'
require 'socky-client'
require 'socky-client-rails/railtie' if defined?(Rails::Railtie)

module Socky
  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :Helper,              "#{ROOT}/socky-client-rails/helper"
  autoload :JavaScriptGenerator, "#{ROOT}/socky-client-rails/java_script_generator"

  class << self

    def config_path
      @config_path ||= Rails.root.join("config","socky_hosts.yml")
    end

    def random_host
      hosts[rand(hosts.size)]
    end

    # Javascript will not work in Rails >= 3.1 due to removing PrototypeHelper
    unless Rails.version >= '3.1'
      def send(data = nil, options = {}, &block)
        options = normalize_options(data, options)
        options[:data] = JavaScriptGenerator.new(&block).to_s unless block.nil?
        send_message(options.delete(:data), options)
      end
    end

  end
end

ActionView::Base.send(:include, Socky::Helper)
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :socky => ['socky']