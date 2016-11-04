class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.timestamps
      t.integer :disc1id
      t.integer :disc2id
      t.integer :disc3id
    end
    
    change_table :teams do |f|
      f.belongs_to :application, index: true
    end
    
    change_table :discussions do |g|
      g.belongs_to :application, index: true
    end
  end
end
