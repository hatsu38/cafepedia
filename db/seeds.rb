# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

mainstore_array = [["スターバックス","./app/assets/images/starbacks_logo.png"],
                   ["ドトールコーヒー","./app/assets/images/doutor/doutor_logo.jpg"],
                   ["タリーズコーヒー","./app/assets/images/tullys_logo.jpg"],
                   ["コメダ珈琲","./app/assets/images/komeda_logo.jpg"],
                   ["ルノアール","./app/assets/images/renoir/kissa_renior_logo.jpg"],
                   ["PRONTO","./app/assets/images/pronto_logo.jpg"],
                   ["上島珈琲店","./app/assets/images/ueshima/ueshima.png"],
                   ["オーバカナル|ドトールコーヒー","./app/assets/images/doutor/auxbacchanales_logo.jpg"],
                   ["カフェ ラミル|ドトールコーヒー","./app/assets/images/doutor/cafelamille_logo.png"],
                   ["カフェ レクセル|ドトールコーヒー","./app/assets/images/doutor/cafelexcel_logo.png"],
                   ["カフェ コロラド|ドトールコーヒー","./app/assets/images/doutor/colorado_logo.png"],
                   ["エクセルシオール|ドトールコーヒー","./app/assets/images/doutor/execelsior_logo.jpg"],
                   ["ルサロンドニナス|ドトール","./app/assets/images/doutor/lusalondninas_logo.gif"],
                   ["カフェ マカメドウズ|ドトール","./app/assets/images/doutor/maukameadows_logo.jpg"],
                   ["ニナス パリ|ドトール","./app/assets/images/doutor/ninas_pari_logo.png"],
                   ["パリッシモ|ドトール","./app/assets/images/doutor/parissimo_logo.png"],
                   ["テ ニナス|ドトール","./app/assets/images/doutor/teninasu_logo.png"],
                   ["Cafe Miyama|ルノアール","./app/assets/images/renoir/cafemiyama_logo.jpg"],
                   ["Cafe Renoir|ルノアール","./app/assets/images/renoir/caferenoir_logo.png"],
                   ["ミヤマ珈琲|ルノアール","./app/assets/images/renoir/miyama_coffee_logo.jpg"],
                   ["MySpace|ルノアール","./app/assets/images/renoir/myspace_logo.png"],
                   ["NewYorker’s Cafe|ルノアール","./app/assets/images/renoir/newyorkers_logo.png"],
                   ["瑠之亜珈琲|ルノアール","./app/assets/images/renoir/runoacoffee_logo.png"],
                   ["ブックス&カフェ|上島珈琲店","./app/assets/images/ueshima/books_cafe.png"],
                   ["カフェノバール|上島珈琲店","./app/assets/images/ueshima/cafenobar.jpeg"],
                   ["カフェラ|上島珈琲店","./app/assets/images/ueshima/caffera.jpg"],
                   ["カフェコンフォート|上島珈琲店","./app/assets/images/ueshima/comfort.jpg"],
                   ["神戸カプチーノ倶楽部|上島珈琲店","./app/assets/images/ueshima/kobe.jpg"],
                   ["MELLOW BROWN COFFEE|上島珈琲店","./app/assets/images/ueshima/mellowbrown.png"],
                   ["カフェメルカード|上島珈琲店","./app/assets/images/ueshima/mercado.jpg"],
                   ["カフェプラザ|上島珈琲店","./app/assets/images/ueshima/plaza.jpeg"],
                   ["ウイーンの森|上島珈琲店","./app/assets/images/ueshima/wien.png"],
                   ["その他|上島珈琲店","./app/assets/images/ueshima/other.png"],
]

mainstore_array.each_with_index do |mainstore,i|
  Mainstore.create(
    id: i + 1,
    name: mainstore[0],
    image: File.open(mainstore[1])
  )
end

csv_file_array = ["db/starbacks.csv",
                  "db/doutor/doutor.csv",
                  "db/tullys.csv",
                  "db/komeda.csv",
                  "db/renoir/kissa_renoir.csv",
                  "db/pronto.csv",
                  "db/ueshima.csv",
                  "db/doutor/auxbacchanales.csv",
                  "db/doutor/cafelamille.csv",
                  "db/doutor/cafelexcel.csv",
                  "db/doutor/colorado.csv",
                  "db/doutor/execelsior.csv",
                  "db/doutor/lusalondninas.csv",
                  "db/doutor/maukameadows.csv",
                  "db/doutor/ninas_pari.csv",
                  "db/doutor/parissimo.csv",
                  "db/doutor/teninasu.csv",
                  "db/renoir/cafemiyama.csv",
                  "db/renoir/caferenoir.csv",
                  "db/renoir/miyama_coffee.csv",
                  "db/renoir/myspace.csv",
                  "db/renoir/newyorkers.csv",
                  "db/renoir/runoacoffee.csv",
                  "db/ueshima/books_cafe.csv",
                  "db/ueshima/cafenobar.csv",
                  "db/ueshima/cafera.csv",
                  "db/ueshima/comfort.csv",
                  "db/ueshima/kobe.csv",
                  "db/ueshima/mellow_brown.csv",
                  "db/ueshima/mercard.csv",
                  "db/ueshima/plaza.csv",
                  "db/ueshima/wien.csv",
                  "db/ueshima/other.csv",
                  ]

csv_file_array.each_with_index do |csv_file,time|
  CSV.foreach(csv_file, headers: true) do |data|
    Store.create(
      name: data[1],
      prefecture: data[2],
      city: data[3],
      other_address: data[4],
      access: data[5],
      tel: data[6],
      business_hour: data[7],
      chair: data[15],
      hp: data[8],
      wifi: data[9],
      socket: data[10],
      smoking: data[11],
      iccard: data[12],
      lat: data[13],
      lng: data[14],
      distance: 0,
      mainstore_id: time+1
    )
  end
end
