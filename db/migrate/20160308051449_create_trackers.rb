class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :person
      t.string :location
      t.timestamps null: false
    end
    add_index :trackers, :person
  end
end
