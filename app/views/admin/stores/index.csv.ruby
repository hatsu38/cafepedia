# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[id name prefecture city other_address access
                        tel business_hour chair hp wifi socket smoking
                        iccard is_open lat lng distance mainstore_id]
  csv << csv_column_names
  @allstores.each do |store|
    csv_column_values = [
      store.id, store.name, store.prefecture, store.city,
      store.other_address, store.access, store.tel, store.business_hour,
      store.chair, store.hp, store.wifi, store.socket,
      store.smoking, store.iccard, store.is_open, store.lat, store.lng,
      store.distance, store.mainstore_id
    ]
    csv << csv_column_values
  end
end
