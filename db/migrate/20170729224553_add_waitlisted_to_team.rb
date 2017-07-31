class AddWaitlistedToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :waitlisted, :boolean
  end
end
