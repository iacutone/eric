class Move
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :date,     type: Time
  field :activity, type: String
  field :duration, type: String
  field :distance, type: String
  field :steps,    type: String
  field :calories, type: String
end
