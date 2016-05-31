# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create( email: "a@a.com", password: "12345678")
User.create( email: "b@b.com", password: "12345678")

Product.create( name: "Pencil",price: 1000,sku:"XX0001")
Product.create( name: "Phone",price: 2000,sku:"XX0002")
Product.create( name: "Pendrive",price: 3000,sku:"XX0003")

