class AddDayToDiscussion < ActiveRecord::Migration
  def change
    add_column :discussions, :day, :string
  end
end
