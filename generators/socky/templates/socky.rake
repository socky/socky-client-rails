begin
  Dir["#{Gem.searcher.find('socky-client-rails').full_gem_path}/lib/tasks/*.rake"].each { |ext| load ext }
rescue
  puts 'You are missing socky-client-rails gem. Please install it.'
end