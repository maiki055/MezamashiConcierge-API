class AddAreaToPrefectures < ActiveRecord::Migration
  def change
    add_reference :prefectures, :area, index: true, foreign_key: true
  end
end
