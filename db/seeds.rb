# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  Store.create(
    name: Faker::FunnyName.name,
    prefecture: "東京都",
    city: "葛飾区",
    town: "金町",
    tyo: 6,
    ban: 4,
    go: 2,
    access: "金町駅から徒歩1分",
    tel: "03-3826-2323",
    weekday_start: "7:00",
    weekday_finish: "22:00",
    saturday_start: "7:00",
    saturday_finish: "22:00",
    sunday_start: "7:00",
    sunday_finish: "22:00",
    hp: "https://www.starbucks.co.jp/store/search/detail.php?id=0264i",
    wifi: Faker::Boolean.boolean,
    socket: Faker::Boolean.boolean,
    smoking: Faker::Boolean.boolean,
    mainstore_id: 1
  )
end

Mainstore.create(
  name: Faker::Coffee.blend_name,
  logo: Faker::Avatar.image,
)
