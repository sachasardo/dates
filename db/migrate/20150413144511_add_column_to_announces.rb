class AddColumnToAnnounces < ActiveRecord::Migration
  def change
    change_column :announces, :text, :text
  end
end
