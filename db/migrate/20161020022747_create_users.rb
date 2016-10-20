class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :team
      t.string :major
      t.string :name
      t.string :email
      t.string :sid
      t.string :password

      t.timestamps null: false
    end
  end
end
