class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.boolean :out_of_zone

      t.timestamps null: false
    end
    add_column :clients, :zone_id, :integer
    add_index :clients, :zone_id
  end
end
