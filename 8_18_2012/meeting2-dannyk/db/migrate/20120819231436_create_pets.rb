class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :kind
      t.datetime :birthday

      t.timestamps
    end
  end
end
