class RemoveMembersFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :members, :string
    remove_column :teams, :string, :string
  end
end
