class RemovePendingRequests < ActiveRecord::Migration
  def change
    remove_column :teams, :pending_requests
  end
end
