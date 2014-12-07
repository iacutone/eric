desc 'pull daily data from Moves API'
task :get_daily_moves => :environment do
  MovesApi.new.daily
end

desc 'pull daily data from Foursquare API'
task :get_daily_foursquare => :environment do
  FoursquareApi.new.daily
end