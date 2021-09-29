class Region < ApplicationRecord
  validates :property_location, presence: true, uniqueness: true
  has_many :properties
end
