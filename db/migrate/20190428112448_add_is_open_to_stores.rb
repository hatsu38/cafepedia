class AddIsOpenToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :is_open, :boolean,null: false, default: false
  end
end
