class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.references :user, foreign_key: true
      t.string :address_type

      t.timestamps
    end
  end
end
