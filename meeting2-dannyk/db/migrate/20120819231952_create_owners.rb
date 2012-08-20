class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.datetime :birthday
      t.integer :gender

      t.timestamps
    end
  end
end
