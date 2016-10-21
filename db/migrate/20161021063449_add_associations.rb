class AddAssociations < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :team, index: true
    end
  end
end
