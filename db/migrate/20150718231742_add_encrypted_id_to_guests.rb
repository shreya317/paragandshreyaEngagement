class AddEncryptedIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :encrypted_id, :string
  end
end
