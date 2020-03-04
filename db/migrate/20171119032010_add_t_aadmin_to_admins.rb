class AddTAadminToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :TAadmin, :boolean
  end
end
