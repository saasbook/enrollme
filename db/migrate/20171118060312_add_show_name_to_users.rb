class AddShowNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_name, :boolean
  end
end
