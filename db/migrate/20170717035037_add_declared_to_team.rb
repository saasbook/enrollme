class AddDeclaredToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :declared, :string
  end
end
