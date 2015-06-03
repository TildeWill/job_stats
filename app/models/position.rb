class Position < ActiveRecord::Base
  has_many :characteristics

  accepts_nested_attributes_for :characteristics,
    :allow_destroy => true,
    :reject_if => :all_blank

  has_many :ratings, through: :characteristics
end
