# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |i|
  Store.create(
    name: Faker::FunnyName.name,
    prefecture: "東京都",
    city: "葛飾区",
    other_address: "金町6-4-2ラヴィクレール金町",
    access: "金町駅から徒歩1分",
    tel: "03-3826-2323",
    business_hour: "月〜土：07:00〜22:00日祝：08:00〜22:00",
    hp: "https://www.starbucks.co.jp/store/search/detail.php?id=0264i",
    wifi: Faker::Boolean.boolean,
    socket: Faker::Boolean.boolean,
    smoking: true,
    mainstore_id: rand(2)+1
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
