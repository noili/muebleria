# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
user = User.where(email: 'juan@hotmail.com').first_or_create
user.password = 'password'
user.save

Client.where(dni: '11111', name: 'Juan doe', address: 'Saavedra 2854',
             email: 'some@email.com', phone: '0342 555 55555',
             cellphone: '9 54 342 655 5555').first_or_create
