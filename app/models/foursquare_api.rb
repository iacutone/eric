class FoursquareApi
    
  attr_reader :client
  
  def initialize
    @client = Foursquare2::Client.new(:oauth_token => ENV['foursquare_access_token'], :api_version => '20131016')
  end
  
  def daily
    check_ins = client.user_checkins
    check_ins['items'].each do |item|
      time = Time.at(item['createdAt'])
      if time > Date.today.beginning_of_day - 1.day && time < Date.today.end_of_day - 1.day
        @foursquare = Foursquare.new
        @foursquare.date     = time
        @foursquare.name     = item['venue']['name']
        @foursquare.category = item['venue']['categories'].first['name']
        @foursquare.lat      = item['venue']['location']['lat']
        @foursquare.lng      = item['venue']['location']['lng']
        @foursquare.save! 
      end
    end
  end
  
end