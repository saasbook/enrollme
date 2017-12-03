class AddEmailsSentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emails_sent, :text
  end
end
