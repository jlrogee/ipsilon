# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.any?
  User.create(email: "admin@admin.org", password: "IpsilonA", role: "admin", agree: true)
  User.create(email: "user@admin.org", password: "IpsilonU", role: "user", agree: true)
  User.create(email: "spec@admin.org", password: "IpsilonS", role: "spec", agree: true)
  User.create(email: "dispather@admin.org", password: "IpsilonD", role: "dispatcher", agree: true)
end