# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin1 = Scholar.create! name: "Danielle Van Suchtelen", password: "admin", password_confirmation: "admin", username: "admin", email: "danielles.travels@gmail.com", student: false