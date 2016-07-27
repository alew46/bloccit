# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


uniquepost = Post.find_or_create_by(title: "Alex's unique post", body: "This is Alex's unique post, check it out!")

Comment.find_or_create_by(body: "This comment is special; it's the only one of it's kind.", post: uniquepost)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
