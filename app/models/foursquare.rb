class Foursquare
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :date,     type: Time
  field :name,     type: String
  field :category, type: String
  field :lat,      type: String
  field :lng,      type: String
end
