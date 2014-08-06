# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.any?
  User.create(email: "admin@admin.org", password: "IpsilonA", role: "admin", agree: "1")
  User.create(email: "user@admin.org", password: "IpsilonU", role: "user", agree: "1")
  User.create(email: "spec@admin.org", password: "IpsilonS", role: "spec", agree: "1")
  User.create(email: "dispather@admin.org", password: "IpsilonD", role: "dispatcher", agree: "1")
end
unless Priority.any?
  Priority.create(prname: "Very Low", days_to_close: 7)
  Priority.create(prname: "Low", days_to_close: 5)
  Priority.create(prname: "Medium", days_to_close: 3)
  Priority.create(prname: "High", days_to_close: 2)
  Priority.create(prname: "Very High", days_to_close: 1)
end
unless Problem.any?
  25.times { Problem.create(create_user_id: 2, description: "Problem #{i} description", category_id: 10, priority_id: 3)}
end
unless Category.any?
  25.times{ |i| Category.create(catname: "Category #{i}")}
end