class AddGoodToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :good, :boolean
  end
end
