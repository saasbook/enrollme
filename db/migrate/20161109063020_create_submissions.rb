class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :disc1id
      t.integer :disc2id
      t.integer :disc3id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
