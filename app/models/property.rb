class Property < ApplicationRecord
  validates :title, :description, :rooms, :bathrooms, :daily_rate,
            presence: {message: 'não pode ficar em branco'}
  validates :rooms, :bathrooms, :daily_rate,
            numericality: {only_integer: true, greater_than: 0, message: 'tem que ser um número maior que 0'}
  belongs_to :property_type
end
