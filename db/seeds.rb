# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

for i in 0..10
  Suuryou.create(suuryou: i)
  end


  require "csv"

CSV.foreach('db/seeds/Syokuzai.csv', headers: true) do |row|
  Syokuzai.create!(
    category: row['category'],
    name: row['name'],
    weight: row['weight'],
    calorie: row['calorie'],
    explanation: row['explanation']
  )
end



# Syokuzai.create(

# category: 'soup',

# name: '辛いスープ',

# weight: 0,

# calorie: 71,

# explanation: '辛いスープ。普通でもけっこう辛い。ティッシュの持参は必須だ。'

# )

# Syokuzai.create(

# category: 'vegetables',

# name: '青梗菜',

# weight: 17,

# calorie: 2,

# explanation: '中華の定番。２番目に選ばれることが多い。'

# )

# Syokuzai.create(

# category: 'vegetables',

# name: 'じゃがいも',

# weight: 8,

# calorie: 11,

# explanation: '意外と糖質が低い。'

# )

# Syokuzai.create(

# category: 'men',

# name: '春雨',

# weight: 1,

# calorie: 3,

# explanation: '６本あたりの数値。辛い麺といえば春雨。'

# )

# Syokuzai.create(

# category: 'nerimono',

# name: '謎だんご',

# weight: 30,

# calorie: 25,

# explanation: '謎だが異様にうまいだんご。中からかにみそと魚卵がトロリと出てくる。'

# )

# Syokuzai.create(

# category: 'meats',

# name: 'ラム',

# weight: 15,

# calorie: 25,

# explanation: '臭みなし。あなた本当に羊？'

# )

# Syokuzai.create(

# category: 'seafoods',

# name: 'えび',

# weight: 4,

# calorie: 3,

# explanation: 'ぷりりとしたえび。'

# )

# Syokuzai.create(

# category: 'sonota',

# name: '鴨の血',

# weight: 30,

# calorie: 10,

# explanation: '本場の風を取り入れたいならマスト。'

# )

