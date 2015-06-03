class Rating < ActiveRecord::Base
  belongs_to :characteristic
  has_one :rating
  enum value: {rarely: 0, sometimes: 1, often: 2, consistently: 3, always: 4}
end
