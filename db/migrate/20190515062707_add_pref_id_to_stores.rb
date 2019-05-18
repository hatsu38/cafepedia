class AddPrefIdToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :pref, foreign_key: true, null: false, default: 13
  end
end
