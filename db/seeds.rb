# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# puts 'Populating skill by fake data'
# %w[API Ruby Rails Mysql].each do |kill|
#   Admin::Skill.find_or_create_by!(name: kill)
# end

puts 'Populating category by fake data'
%w[IT Agriculture Business Teaching].each do |kill|
  Admin::Category.find_or_create_by!(name: kill)
end

# puts 'Populating company by fake data'
# 30.times.each do |kill|
#   Admin::Company.find_or_create_by!(name: Faker::Company.name)
# end


# puts 'Populating articles by fake data'

# user = User.find_or_create_by(email: 'admin@dw.com') do |user|
#   user.password = 'password'
#   user.full_name = Faker::Name.name
# end
# 10.times.each do |_t|
#   author = Blog::Author.find_or_create_by(user: user)
#   puts 'Author Created'
#
#   100.times.each do |_t|
#     article = author.articles.new
#     article.title = Faker::Lorem.unique.sentence(word_count: 3)
#     article.body = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
#     article.save!
#
#     puts 'Article created'
#
#     100.times.each do |_t|
#       comment = article.comments.new
#       comment.body = Faker::Lorem.unique.sentence(word_count: 3)
#       comment.author = author
#       comment.save!
#
#       puts 'Comment Created'
#     end
#
#   end
#   puts "Articles and Comments created under the author name : #{author.user.full_name}"
# end