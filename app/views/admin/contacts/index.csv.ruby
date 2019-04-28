# frozen_string_literal: true

require 'csv'

CSV.generate do |csv|
  csv_column_names = %w[id message email created_at updated_at]
  csv << csv_column_names
  @all_contacts.each do |contact|
    csv_column_values = [
      contact.id, contact.message, contact.email,
      contact.created_at.strftime("%Y/%m/%d %H:%M:%S"),
      contact.updated_at.strftime("%Y/%m/%d %H:%M:%S")
    ]
    csv << csv_column_values
  end
end
