class AddSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ruby_on_rails, :integer
    add_column :users, :other_backend, :integer
    add_column :users, :frontend, :integer
    add_column :users, :ui_design, :integer
    add_column :users, :team_management, :integer
  end
end
