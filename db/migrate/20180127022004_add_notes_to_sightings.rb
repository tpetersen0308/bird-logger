class AddNotesToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :notes, :text
  end
end
