class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :hash
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
