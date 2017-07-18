class AddMembersToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :members, :string
  end
end
