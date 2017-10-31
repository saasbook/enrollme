class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
