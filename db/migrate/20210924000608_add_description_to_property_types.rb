class AddDescriptionToPropertyTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :property_types, :description, :string
  end
end
