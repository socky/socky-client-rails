require 'fileutils'

SOCKY_JS_VERSION = File.read(File.dirname(__FILE__) + '/../../VERSION').strip.split('.')[0,2].join('.')
SOCKY_JS_SERVER = 'http://js.socky.org'
SOCKY_JS_DEST = Rails.root.join('public', 'javascripts').to_s
SOCKY_JS_FILES = {
  'socky.js' => 'socky.js',
  'assets/flashfallback.js' => 'socky/flashfallback.js',
  'assets/WebSocketMain.swf' => 'socky/WebSocketMain.swf'
}

CONFIG_PATH = File.join(File.dirname(__FILE__), '..', '..', 'assets', 'socky_hosts.yml')

namespace :socky do
  desc 'Install the Socky scripts and create configuration file'
  task :install => [:create_scripts, :create_config]

  desc 'Update the Socky scripts'
  task :update => [:create_scripts]

  desc 'Remove the Socky scripts'
  task :uninstall => [:remove_scripts]

  task :create_config do
    dest = Rails.root.join('config', 'socky_hosts.yml').to_s
    if File.exists?(dest)
      FileUtils.rm_rf dest
    end
    begin
      puts "Copying config..."
      FileUtils.cp_r CONFIG_PATH, dest
      puts "Done"
    rescue
      puts "ERROR: Problem creating config. Please manually copy " + CONFIG_PATH + " => " + dest
    end
  end


  task :create_scripts do
    require 'open-uri'
    puts 'Downloading files...'
    SOCKY_JS_FILES.each do |source, dest|
      begin
        uri = URI.parse(SOCKY_JS_SERVER + '/v' + SOCKY_JS_VERSION + '/' + source)
        file = File.join(SOCKY_JS_DEST, dest)
        puts ' + ' + dest
        FileUtils.mkdir_p(File.dirname(file))
        open(uri) do |data|
          open(file, "wb") do |f|
            f.write(data.read)
          end
        end
      rescue
        puts "ERROR: Problem downloading script. Please manually copy " + uri.to_s + " => " + file
      end
    end
    script_file = File.join(SOCKY_JS_DEST, 'socky.js').to_s
    if File.exists?(script_file)
      puts 'Updating assets info'
      text = File.read(script_file)
      open(script_file, 'wb') do |f|
        f.write text.gsub(/SOCKY_ASSET_LOCATION = '(.+)';/, 'SOCKY_ASSET_LOCATION = "/javascripts/socky";')
      end
    end
    puts "Done"
  end

  task :remove_scripts do
    puts 'Removing files...'
    SOCKY_JS_FILES.each do |source, dest|
      file = SOCKY_JS_DEST + dest
      if File.exists?(file)
        begin
          FileUtils.rm_rf file
        rescue
          puts "ERROR: Problem removing #{file}. Please remove manually."
        end
      end
    end
    puts "Successfully removed Socky."
  end

end
