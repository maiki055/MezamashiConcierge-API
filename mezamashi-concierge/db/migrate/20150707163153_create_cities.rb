class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string     :name, null: false
      t.references :prefecture, index: true
      t.float      :longitude, default: 0
      t.float      :latitude, default: 0

      t.timestamps null: false
    end
  end
end
