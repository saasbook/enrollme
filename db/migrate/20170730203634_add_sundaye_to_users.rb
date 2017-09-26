class AddSundayeToUsers < ActiveRecord::Migration
  def change
        add_column :users, :sunday, :integer
  end
end
