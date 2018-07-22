class CreateMainstores < ActiveRecord::Migration[5.0]
  def change
    create_table :mainstores do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
