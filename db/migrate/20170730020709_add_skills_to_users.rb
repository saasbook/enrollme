class AddSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ruby, :integer
    add_column :users, :rails, :integer
    add_column :users, :html, :integer
    add_column :users, :css, :integer
    add_column :users, :javascript, :integer
    add_column :users, :ui_design, :integer
    add_column :users, :leadership_skills, :integer
  end
end
