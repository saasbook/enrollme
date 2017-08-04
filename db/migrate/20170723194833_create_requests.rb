class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :team_source # sender
      t.integer :team_target
    end
  end
end
