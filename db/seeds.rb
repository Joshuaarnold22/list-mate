# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create(name: 'josh', email: 'test@gmail.com', password: 'test')

List.create(title: 'First List')

Item.create(title: 'First Item', body: 'Bla Bla Bla')
