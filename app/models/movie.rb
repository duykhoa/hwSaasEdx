class Movie < ActiveRecord::Base
  scope :rating, lambda { |rate| where(:rating => rate) }
end
