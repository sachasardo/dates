class AddColumnToAnnounces < ActiveRecord::Migration
  def change
    add_column :announces, :text, :string
  end
end
