class AddAdminTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_time_from, :integer
    add_column :users, :admin_time_to, :integer
  end
end
