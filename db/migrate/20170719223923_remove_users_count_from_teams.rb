class RemoveUsersCountFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :users_count, :string
    remove_column :teams, :integer, :string
  end
end
