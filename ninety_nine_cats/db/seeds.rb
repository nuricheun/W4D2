# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

Cat.create!(birth_date: '2017/01/20', color:"red", name:Faker::Beer.name, sex:"F",description:Faker::Demographic.race)
Cat.create!(birth_date: '2014/06/20', color:"orange", name:Faker::Beer.name, sex:"M",description:Faker::Demographic.race)
Cat.create!(birth_date: '2019/01/20', color:"blue", name:Faker::Beer.name, sex:"F",description:Faker::Demographic.race)
Cat.create!(birth_date: '2018/03/20', color:"green", name:Faker::Beer.name, sex:"M",description:Faker::Demographic.race)
Cat.create!(birth_date: '2018/08/11', color:"green", name:Faker::Beer.name, sex:"M",description:Faker::Demographic.race)
Cat.create!(birth_date: '2019/01/02', color:"green", name:Faker::Beer.name, sex:"F",description:Faker::Demographic.race)

CatRentalRequest.create!(cat_id: Cat.first.id, start_date: '2019/03/20', end_date: '2019/03/30', status: "APPROVED")
CatRentalRequest.create!(cat_id: Cat.last.id, start_date: '2019/04/01', end_date: '2019/04/30', status: "APPROVED")
CatRentalRequest.create!(cat_id: Cat.second.id, start_date: '2019/05/20', end_date: '2019/05/30', status: "PENDING")
CatRentalRequest.create!(cat_id: Cat.third.id, start_date: '2019/06/20', end_date: '2019/06/30', status: "PENDING")
