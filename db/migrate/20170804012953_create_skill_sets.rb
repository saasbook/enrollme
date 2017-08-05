class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.integer :ruby_on_rails
      t.integer :other_backend
      t.integer :frontend
      t.integer :ui_design
      t.integer :team_management
      t.references :user, index: true, foreign_key: true
    end
  end
end
