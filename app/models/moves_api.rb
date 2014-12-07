class MovesApi
  attr_reader :client
  
  def initialize
    @client = Moves::Client.new(ENV['moves_access_token'])
  end
  
  def daily
    moves = client.daily_summary(Date.today - 1)
    moves.each do |outer_hash|
      if outer_hash['date'].present? && outer_hash['summary'].present?
        @move = Move.new
        @move.date     = outer_hash['date']
        walking_data   = outer_hash['summary'].first
        @move.activity = walking_data['activity']
        @move.duration = walking_data['duration']
        @move.distance = walking_data['distance']
        @move.steps    = walking_data['steps']
        @move.calories = walking_data['calories']
        @move.save!
      end
    end
  end
  
  # def get_location
  #   places = moves.daily_places(Date.today - 1)
  # end
end