class CreateRailroads < ActiveRecord::Migration
  def change
    create_table :railroads do |t|
      t.string :name
      t.string :state
      t.string :state_detail
      t.integer :status
      t.references :railroad_company, index: true

      t.timestamps null: false
    end
  end
end
