class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string   :weather
      t.string   :description
      t.float    :temp,        default: 0
      t.float    :temp_min,    default: 0
      t.float    :temp_max,    default: 0
      t.integer  :pressure,    default: 0
      t.integer  :humidity,    default: 0
      t.float    :wind_speed,  default: 0
      t.integer  :wind_deg,    default: 0
      t.float    :rain_volume, default: 0
      t.integer  :rain_hour,   default: 0
      t.float    :snow_volume, default: 0
      t.integer  :snow_hour,   default: 0
      t.integer  :cloudiness,  default: 0
      t.datetime :calculated_at
      t.references :city, index: true

      t.timestamps null: false
    end
  end
end
