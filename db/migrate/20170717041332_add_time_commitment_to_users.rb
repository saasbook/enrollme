class AddTimeCommitmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_commitment, :integer
  end
end
