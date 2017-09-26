class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monday, :integer
    add_column :users, :tuesday, :integer
    add_column :users, :wednesday, :integer
    add_column :users, :thursday, :integer
    add_column :users, :friday, :integer
    add_column :users, :saturday, :integer
  end
end
