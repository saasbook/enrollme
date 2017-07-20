class AddAbcCountToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :abc_count, :string
    add_column :teams, :integer, :string
  end
end
