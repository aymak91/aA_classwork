# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!([{name: 'Meh', birth_date: '2012/12/15', color: 'Black', sex: 'M'}])
cat2 = Cat.create!([{name: 'Selvage', birth_date: '2010/10/16', color: 'White', sex: 'M', description: "Beautiful cat"}])
cat3 = Cat.create!([{name: 'Narwhal', birth_date: '2016/04/25', color: "Orange", sex: "F", description: "Beautiful cat"}])