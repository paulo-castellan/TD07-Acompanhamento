class Property < ApplicationRecord
  validates :title, :description, :rooms, :bathrooms, :daily_rate,
            presence: true
  validates :rooms, :bathrooms, :daily_rate,
            numericality: {only_integer: true, greater_than: 0 }
  belongs_to :property_type
  belongs_to :region
  belongs_to :property_owner
end
