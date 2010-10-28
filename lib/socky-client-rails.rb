require 'yaml'
require 'socky-client'
require File.dirname(__FILE__) + '/socky-client-rails/helper'
require File.dirname(__FILE__) + '/socky-client-rails/java_script_generator'
require 'socky-client-rails/railtie' if defined?(Rails::Railtie)

module Socky
  
  class << self

    def config_path
      @config_path ||= Rails.root.join("config","socky_hosts.yml")
    end

    def send(data = nil, options = {}, &block)
      options = normalize_options(data, options)
      options[:data] = JavaScriptGenerator.new(&block).to_s unless block.nil?
      send_message(options.delete(:data), options)
    end

    def random_host
      hosts[rand(hosts.size)]
    end

  end

end