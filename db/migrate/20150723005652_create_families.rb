class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :family_name

      t.timestamps null: false
    end
  end
end
