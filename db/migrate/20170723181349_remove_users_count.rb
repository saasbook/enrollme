class RemoveUsersCount < ActiveRecord::Migration
  def change
    remove_column :teams, :users_count
  end
end
