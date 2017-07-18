class AddNumMembersToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :num_members, :integer
  end
end
