class PropertyType < ApplicationRecord
  validates :description, presence: true, uniqueness: true
  has_many :properties
end
