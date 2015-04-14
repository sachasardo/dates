class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :name
      t.integer :stars
      t.string :key_words
      t.string :text

      t.timestamps null: false
    end
  end
end
