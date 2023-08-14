# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Populating articles by fake data'

# Blog::Comment.destroy_all
# Blog::Article.destroy_all
# Blog::Author.destroy_all

10.times.each do |_t|
  author = Blog::Author.create(full_name:Faker::Name.unique.name)
  puts 'Author Created'

  100.times.each do |_t|
    article = author.articles.new
    article.title = Faker::Lorem.unique.sentence(word_count: 3)
    article.body = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
    article.save!

    puts 'Article created'

    100.times.each do |_t|
      comment = article.comments.new
      comment.body = Faker::Lorem.unique.sentence(word_count: 3)
      comment.author = author
      comment.save!

      puts 'Comment Created'
    end

  end
  puts "Articles and Comments created under the author name : #{author.full_name}"
end