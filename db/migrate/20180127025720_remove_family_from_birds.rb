class RemoveFamilyFromBirds < ActiveRecord::Migration
  def change
    remove_column :birds, :family
  end
end
