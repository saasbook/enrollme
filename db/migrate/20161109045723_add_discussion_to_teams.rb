class AddDiscussionToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :discussion, index: true, foreign_key: true
  end
end
