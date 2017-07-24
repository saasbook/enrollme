class AddUsersCountToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :users_count, :integer
  end
end
