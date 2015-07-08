class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string   :weather
      t.string   :description
      t.float    :temp,        default: 0, null: false
      t.float    :temp_min,    default: 0, null: false
      t.float    :temp_max,    default: 0, null: false
      t.integer  :pressure,    default: 0, null: false
      t.integer  :humidity,    default: 0, null: false
      t.float    :wind_speed,  default: 0, null: false
      t.integer  :wind_deg,    default: 0, null: false
      t.float    :rain_volume, default: 0, null: false
      t.integer  :rain_hour,   default: 0, null: false
      t.float    :snow_volume, default: 0, null: false
      t.integer  :snow_hour,   default: 0, null: false
      t.integer  :cloudiness,  default: 0, null: false
      t.datetime :calculated_at
      t.references :city, index: true

      t.timestamps null: false
    end
  end
end
