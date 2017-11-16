class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :email, null: false
      t.string :password, null: false
      t.string :major, null:false
      t.string :sid, null:false
      t.boolean :show_name, default: false
      t.timestamps null: false
    end
  end
end
