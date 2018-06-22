# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

starbacks_csv_file = "db/migrate/starbacks_info.csv"
CSV.read(starbacks_csv_file).each_with_index do |data,i|
  next if i == 0
  Store.create(
    name: data[1],
    prefecture: data[2],
    city: data[3],
    other_address: data[4],
    access: data[5],
    tel: data[6],
    business_hour: data[7],
    hp: data[8],
    wifi: data[9],
    socket: data[10],
    smoking: data[11],
    iccard: data[12],
    mainstore_id: 1
  )
end

doutor_csv_file = "db/migrate/doutor_info.csv"
CSV.read(doutor_csv_file).each_with_index do |data,i|
  next if i == 0
  Store.create(
    name: data[1],
    prefecture: data[2],
    city: data[3],
    other_address: data[4],
    access: data[5],
    tel: data[6],
    business_hour: data[7],
    hp: data[8],
    wifi: data[9],
    socket: data[10],
    smoking: data[11],
    iccard: data[12],
    mainstore_id: 2
  )
end


Mainstore.create(
  id: 1,
  name: "スターバックスコーヒー",
  image: File.open("./app/assets/images/starbacks_logo.png")
)
Mainstore.create(
  id: 2,
  name: "ドトールコーヒー",
  image: File.open("./app/assets/images/doutor_logo.jpg")
)
