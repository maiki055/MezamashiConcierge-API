class CreateRailroadCompanies < ActiveRecord::Migration
  def change
    create_table :railroad_companies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
