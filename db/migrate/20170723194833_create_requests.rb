class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id # sender
      t.string :target_type
      t.integer :target_id
    end
  end
end
