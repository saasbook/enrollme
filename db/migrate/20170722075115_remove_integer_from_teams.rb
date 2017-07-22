class RemoveIntegerFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :integer, :string
  end
end
