class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :source_id # sender
      t.integer :target_id
    end
  end
end
