class AddRailroadToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :railroad, index: true, foreign_key: true, after: :uuid
  end
end
