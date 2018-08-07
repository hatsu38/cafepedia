class CreateLeaks < ActiveRecord::Migration[5.1]
  def change
    create_table :leaks do |t|
      t.string :name
      t.string :address
      t.string :url
      t.boolean :socket
      t.boolean :wifi
      t.boolean :smoking

      t.timestamps
    end
  end
end
