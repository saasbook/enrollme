class AddEnrollmeadminToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :enrollmeadmin, :boolean
  end
end
