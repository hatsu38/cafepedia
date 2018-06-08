class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :prefecture
      t.string :city
      t.string :town
      t.integer :tyo
      t.integer :ban
      t.integer :go
      t.text :access
      t.integer :tel
      t.time :weekday_start
      t.time :weekday_finish
      t.time :saturday_start
      t.time :saturday_finish
      t.time :sunday_start
      t.time :sunday_finish
      t.string :hp
      t.boolean :wifi
      t.boolean :socket
      t.boolean :smoking
      t.references :mainstore, foreign_key: true

      t.timestamps
    end
  end
end
