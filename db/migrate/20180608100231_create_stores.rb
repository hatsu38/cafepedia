class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :prefecture
      t.string :city
      t.string :other_address
      t.text :access
      t.string :tel
      t.text :business_hour
      t.string :hp
      t.boolean :wifi
      t.boolean :socket
      t.boolean :smoking
      t.boolean :iccard
      t.decimal :lat
      t.decimal :lng
      t.integer :distance
      t.references :mainstore, foreign_key: true
      t.timestamps
    end
  end
end
