class AddTeamTable < ActiveRecord::Migration
  def change
    create_table :teams do |e|
      # e.has_many :user, index: true
      e.boolean :approve
      e.string :passcode
      e.timestamps null: false
      
    create_table :users do |t|
      # t.belongs_to team, index: true
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
end
