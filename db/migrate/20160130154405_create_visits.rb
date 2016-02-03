class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.text :description
      t.integer :duration
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
