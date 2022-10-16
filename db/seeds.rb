# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@hh',
  password: '098765'
  )

Tag.create([
  { name: '筋トレ' },
  { name: 'ストレッチ' },
  { name: '有酸素運動' },
  { name: 'スポーツ' },
  { name: '体幹' },
  { name: 'その他' }
])
