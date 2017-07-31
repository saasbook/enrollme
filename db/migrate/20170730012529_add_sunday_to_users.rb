class AddSundayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sunday, :string
    add_column :users, :integer, :string
  end
end
