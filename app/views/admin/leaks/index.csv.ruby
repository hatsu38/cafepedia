# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[id name address url socket wifi smoking created_at updated_at]
  csv << csv_column_names
  @all_leaks.each do |leak|
    csv_column_values = [
      leak.id, leak.name, leak.address, leak.url,
      leak.socket, leak.wifi, leak.smoking,
      leak.created_at.strftime("%Y/%m/%d %H:%M:%S"),
      leak.updated_at.strftime("%Y/%m/%d %H:%M:%S")
    ]
    csv << csv_column_values
  end
end
