class AddUserIdToAnnounce < ActiveRecord::Migration
  def change
    add_column :announces, :user_id, :integer
  end
end
