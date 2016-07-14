class AddDetailsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :details, :text
  end
end
