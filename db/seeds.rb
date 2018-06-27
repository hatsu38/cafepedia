# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

# starbacks_csv_file = "./migrate/starbacks.csv"
# CSV.read(starbacks_csv_file).each_with_index do |data,i|
#   next if i == 0
#   Store.create(
#     name: data[1],
#     prefecture: data[2],
#     city: data[3],
#     other_address: data[4],
#     access: data[5],
#     tel: data[6],
#     business_hour: data[7],
#     hp: data[8],
#     wifi: data[9],
#     socket: data[10],
#     smoking: data[11],
#     iccard: data[12],
#     mainstore_id: 1
#   )
# end
#
# doutor_csv_file = "db/migrate/doutor.csv"
# CSV.read(doutor_csv_file).each_with_index do |data,i|
#   next if i == 0
#   Store.create(
#     name: data[1],
#     prefecture: data[2],
#     city: data[3],
#     other_address: data[4],
#     access: data[5],
#     tel: data[6],
#     business_hour: data[7],
#     hp: data[8],
#     wifi: data[9],
#     socket: data[10],
#     smoking: data[11],
#     iccard: data[12],
#     mainstore_id: 2
#   )
# end
#
csv_file_array = ["./migrate/starbacks.csv",
                  "./migrate/doutor/doutor.csv",
                  "./migrate/tullys.csv",
                  "./migrate/komeda.csv",
                  "./migrate/renoir/kissa_renoir.csv",
                  "./migrate/pronto.csv",
                  "./migrate/doutor/auxbacchanales.csv",
                  "./migrate/doutor/cafelamille.csv",
                  "./migrate/doutor/cafelexcel.csv",
                  "./migrate/doutor/colorado.csv",
                  "./migrate/doutor/execelsior.csv",
                  "./migrate/doutor/lusalondninas.csv",
                  "./migrate/doutor/maukameadows.csv",
                  "./migrate/doutor/ninas_pari.csv",
                  "./migrate/doutor/parissimo.csv",
                  "./migrate/doutor/teninasu.csv",
                  "./migrate/renoir/cafemiyama.csv",
                  "./migrate/renoir/caferenoir.csv",
                  "./migrate/renoir/miyama_coffee.csv",
                  "./migrate/renoir/myspace.csv",
                  "./migrate/renoir/newyorkers.csv",
                  "./migrate/renoir/runoacoffee.csv",
                  ]

csv_file_array.each_with_index do |csv_file,i|
  store_create(csv_file,i+1)
end

def store_create(csv_file,mainstore_id)
  CSV.read(csv_file).each_with_index do |data,i|
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
      mainstore_id: mainstore_id
    )
  end
end

Mainstore.create(
  id: 1,
  name: "スターバックスコーヒー",
  image: File.open("./app/assets/images/starbacks_logo.png")
)
Mainstore.create(
  id: 2,
  name: "ドトールコーヒー",
  image: File.open("./app/assets/images/doutor/doutor_logo.jpg")
)
Mainstore.create(
  id: 3,
  name: "タリーズコーヒー",
  image: File.open("./app/assets/images/tullys_logo.jpg")
)
Mainstore.create(
  id: 4,
  name: "コメダ珈琲",
  image: File.open("./app/assets/images/komeda_logo.jpg")
)

Mainstore.create(
  id: 5,
  name: "ルノアール",
  image: File.open("./app/assets/images/renoir/kissa_renior_logo.jpg")
)
Mainstore.create(
  id: 6,
  name: "PRONTO",
  image: File.open("./app/assets/images/pronto_logo.jpg")
)
Mainstore.create(
  id: 7,
  name: "オーバカナル",
  image: File.open("./app/assets/images/doutor/auxbacchanales_logo.jpg")
)
Mainstore.create(
  id: 8,
  name: "カフェラミル",
  image: File.open("./app/assets/images/doutor/cafelamille_logo.png")
)
Mainstore.create(
  id: 9,
  name: "カフェレクセル",
  image: File.open("./app/assets/images/doutor/cafelexcel_logo.png")
)

Mainstore.create(
  id: 10,
  name: "カフェコロラド",
  image: File.open("./app/assets/images/doutor/colorado_logo.png")
)
Mainstore.create(
  id: 11,
  name: "エクセルシオール",
  image: File.open("./app/assets/images/doutor/execelsior_logo.jpg")
)
Mainstore.create(
  id: 12,
  name: "ル サロンド ニナス",
  image: File.open("./app/assets/images/doutor/lusalondninas_logo.gif")
)
Mainstore.create(
  id: 13,
  name: "カフェ マウカメドウズ",
  image: File.open("./app/assets/images/doutor/maukameadows_logo.jpg")
)
Mainstore.create(
  id: 14,
  name: "ニナス パリ",
  image: File.open("./app/assets/images/doutor/ninas_pari_logo.png")
)
Mainstore.create(
  id: 15,
  name: "パリッシモ",
  image: File.open("./app/assets/images/doutor/parissimo_logo.png")
)
Mainstore.create(
  id: 16,
  name: "テ ニナス",
  image: File.open("./app/assets/images/doutor/teninasu_logo.png")
)
Mainstore.create(
  id: 17,
  name: "Cafe Miyama",
  image: File.open("./app/assets/images/renoir/cafemiyama_logo.jpg")
)
Mainstore.create(
  id: 18,
  name: "Cafe Renoir",
  image: File.open("./app/assets/images/renoir/caferenoir_logo.png")
)
Mainstore.create(
  id: 19,
  name: "ミヤマ珈琲",
  image: File.open("./app/assets/images/renoir/miyama_coffee_logo.jpg")
)
Mainstore.create(
  id: 20,
  name: "MySpace",
  image: File.open("./app/assets/images/renoir/myspace_logo.png")
)
Mainstore.create(
  id: 21,
  name: "NewYorker's Cafe",
  image: File.open("./app/assets/images/renoir/newyorkers_logo.png")
)
Mainstore.create(
  id: 22,
  name: "瑠之亜珈琲",
  image: File.open("./app/assets/images/renoir/runoacoffee_logo.png")
)
