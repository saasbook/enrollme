class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :number
      t.string :time
      t.integer :capacity
    end
    
    change_table :teams do |f|
      f.belongs_to :discussion, index: true
    end
  end
end
