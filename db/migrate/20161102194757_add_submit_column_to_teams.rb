class AddSubmitColumnToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :submitted, :boolean
    Team.update_all(submitted: false)
  end
end
