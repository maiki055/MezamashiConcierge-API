class CreateAreasRailroadCompanies < ActiveRecord::Migration
  def change
    create_table :areas_railroad_companies do |t|
      t.references :area, index: true
      t.references :railroad_company, index: true

      t.timestamps null: false
    end
  end
end
