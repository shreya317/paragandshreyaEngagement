class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.boolean :attending
      t.string :comments

      t.timestamps null: false
    end
  end
end
