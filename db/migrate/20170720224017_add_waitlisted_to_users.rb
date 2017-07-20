class AddWaitlistedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :waitlisted, :string
  end
end
