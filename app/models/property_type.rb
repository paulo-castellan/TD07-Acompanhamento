class PropertyType < ApplicationRecord
  validates :description, presence: true, uniqueness: true
end
