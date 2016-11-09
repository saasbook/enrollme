class AddTeamToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :team, index: true, foreign_key: true
  end
end
