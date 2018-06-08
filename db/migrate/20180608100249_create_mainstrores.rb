class CreateMainstrores < ActiveRecord::Migration[5.1]
  def change
    create_table :mainstrores do |t|
      t.string :name
      t.string :logo
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
