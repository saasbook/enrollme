class RemoveSundayeFromUsers < ActiveRecord::Migration
  def change
            remove_column :users, :sunday, :string
  end
end
