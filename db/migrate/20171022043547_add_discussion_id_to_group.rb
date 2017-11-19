class AddDiscussionIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :discussion_id, :integer
  end
end
