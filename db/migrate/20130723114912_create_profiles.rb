class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :hardware
      t.integer :user_id

      t.timestamps
    end
  end
end
