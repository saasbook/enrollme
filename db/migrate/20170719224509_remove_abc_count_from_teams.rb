class RemoveAbcCountFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :abc_count, :string
    remove_column :teams, :string, :string
  end
end
