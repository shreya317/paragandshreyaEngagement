class AddFamilyIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :family_id, :integer
  end
end
