class Characteristic < ActiveRecord::Base
  belongs_to :position
  has_one :rating
end
