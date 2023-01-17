# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Populating articles by fake data'

Blog::Article.destroy_all

100.times.each do |_t|
  article = Blog::Article.new
  article.title = Faker::Lorem.unique.sentence(word_count: 3)
  article.body = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  article.save!
end