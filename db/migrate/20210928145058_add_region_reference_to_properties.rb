class AddRegionReferenceToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :region, null: false, foreign_key: true
  end
end
