class AddSingletonOption < ActiveRecord::Migration
  def change
    create_table :options, :force => true do |t|
      t.integer :minimum_team_size
      t.integer :maximum_team_size
    end
  end
end
