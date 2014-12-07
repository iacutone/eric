namespace :pull_daily_api_data do
  
  desc 'pull daily data from Moves API'
  task :get_daily_moves => :environment do
    moves = MovesApi.new
    moves.daily
  end
  
  desc 'pull daily data from Foursquare API'
  task :get_daily_foursquare => :environment do
    foursquare = FoursquareApi.new
    foursquare.daily
  end
end