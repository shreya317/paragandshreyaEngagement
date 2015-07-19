class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :guest, index: true
      t.boolean :attending

      t.timestamps null: false
    end
    add_foreign_key :rsvps, :guests
  end
end
