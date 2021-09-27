class Property < ApplicationRecord
  validates  :title, :description, :rooms, :bathrooms, :daily_rate, presence: {message: 'não pode ficar em branco'}
end
