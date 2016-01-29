class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :dni, index: true, null: false
      t.string :name
      t.string :adress
      t.string :email
      t.string :phone
      t.string :cellphone

      t.timestamps null: false
    end
  end
end
