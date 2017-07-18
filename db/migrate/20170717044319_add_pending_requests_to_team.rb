class AddPendingRequestsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :pending_requests, :integer
  end
end
