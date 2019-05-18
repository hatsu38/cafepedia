class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.references :pref, foreign_key: true
      t.string :name, :limit => 16

      t.timestamps
    end
  end
end
