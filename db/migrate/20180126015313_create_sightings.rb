class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :date
      t.string :time
      t.string :location
      t.integer :user_id
      t.integer :bird_id

      t.timestamps null: false
    end
  end
end
