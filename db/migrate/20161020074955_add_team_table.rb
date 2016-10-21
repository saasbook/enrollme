class AddTeamTable < ActiveRecord::Migration
  def change
    create_table :teams do |e|
      e.boolean :approve
      e.string :passcode
      e.timestamps null: false

    end
  end
end
