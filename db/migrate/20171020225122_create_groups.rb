class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps null: false
    end
  end
end
